class ProjetsController < ApplicationController
  before_action :authenticate_contributeur!, only: [:new, :edit, :create, :update]

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
    @categories = Categorie.all
  end

  def edit
    @projet = Projet.find(params[:id])
    render_403 if current_contributeur != @projet.contributeur
    @categories = Categorie.all
  end

  def update
    @projet = Projet.find(params[:id])
    if current_contributeur == @projet.contributeur
      if @projet.update(projet_params)
        redirect_to @projet
      else
        render :edit
      end
    else
      render_403 
    end
  end

  def create
    @projet = Projet.new(projet_params)
    @projet.contributeur_id = current_contributeur.id
    if @projet.save
      redirect_to @projet
    else
      render :new
    end
  end

  private

  def projet_params
    params.require(:projet).permit(:titre, :objectif, :description, :categorie_id)
  end
end
