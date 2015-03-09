class ActualitesController < ApplicationController
  before_action :authenticate_animateur!, except: [:index, :show, :last_actu]

  def index
    @actualites = Actualite.all.reverse
  end

  def new
    @actualite = Actualite.new
  end

  def create
    animateur = current_contributeur
    @actualite = animateur.actualites.new(actualite_params)
    if @actualite.save
      redirect_to @actualite
    else
      render :new
    end
  end

  def last_actu
    @actualite = Actualite.last.id
    redirect_to actualite_path(@actualite)
  end

  def edit
    @actualite = Actualite.find(params[:id])
  end

  def update
    @actualite = Actualite.find(params[:id])
    if @actualite.update(actualite_params)
      redirect_to actualite_path @actualite
    else
      render :edit
    end
  end

  def show
    @actualite = Actualite.find(params[:id])
    @filactu = (Actualite.last(5).reverse - [@actualite])
  end

  def destroy
    @actualite = Actualite.find(params[:id])
    @actualite.destroy
    redirect_to animation_path
  end

  private

  def actualite_params
    params.require(:actualite).permit(:titre, :contenu, :animateur_id, :image, :date, :lieu, :siteweb)
  end
end
