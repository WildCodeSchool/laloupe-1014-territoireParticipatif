class ProjetsController < ApplicationController
  before_action :authenticate_contributeur!, only: [:new, :edit, :create, :update, :like]

  def index
    @projets = Projet.order(updated_at: :desc)
  end

  def show
    @projet = Projet.find(params[:id])
    @commentaires = @projet.commentaires
  end

  def new
    @projet = Projet.new
    @categories = list_categories
  end

  def edit
    @projet = Projet.find(params[:id])
    render_403 if current_contributeur != @projet.contributeur
    @categories = list_categories
  end

  def update
    @projet = Projet.find(params[:id])
    if current_contributeur == @projet.contributeur
      if @projet.update(projet_params)
        redirect_to @projet
      else
        @categories = list_categories
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
      @categories = list_categories
      render :new
    end
  end

  def like
    @projet = Projet.find(params[:id])
    if @projet.liked_by? current_contributeur
      redirect_to @projet
    else
      @projet.likes.create(contributeur_id: current_contributeur.id)
      redirect_to @projet
    end
  end

  def unlike
    @projet = Projet.find(params[:id])
    if @projet.liked_by? current_contributeur
      @projet.likes.select { |like| like.contributeur_id == current_contributeur.id }.first.destroy
    else
      redirect_to @projet
    end
  end

  private

  def projet_params
    params.require(:projet).permit(:titre, :objectif, :description, :categorie_id, :status, :besoin, :localisation, :demarrage)
  end

  def list_categories
    Categorie.all.collect do |cat|
      [cat.nom, cat.id]
    end
  end
end
