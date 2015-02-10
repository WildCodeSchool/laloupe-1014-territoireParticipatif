class ProjetsController < ApplicationController
  def index
    @projets = Projet.order(updated_at: :desc)
    render 'pages/intro'
  end

  def show
    @projet = Projet.find(params[:id])
    @commentaires = @projet.commentaires
  end

  def new
    @projet = Projet.new
  end

  def edit
    @projet = Projet.find(params[:id])
  end

  def update
    @projet = Projet.find(params[:id])
    if @projet.update(projet_params)
      redirect_to @projet
    else
      render :edit
    end
  end

  def create
    @projet = Projet.new(projet_params)
    if @projet.save
      redirect_to @projet
    else
      render :new
    end
  end

  private

  def projet_params
    params.require(:projet).permit(:titre, :objectif, :description)
  end
end
