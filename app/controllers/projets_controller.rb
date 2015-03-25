class ProjetsController < ApplicationController
  before_action :authenticate_contributeur!, only: [:new, :edit, :create, :update, :like]
  before_action :authenticate_animateur!, only: [:destroy]

  def index
    @projets = Projet.order(updated_at: :desc)
  end

  def show
    @projet = Projet.find(params[:id])
    @projets = Projet.echantillon(3, @projet)
    @commentaires = @projet.commentaires
    @commentaire = Commentaire.new
  end

  def new
    @projet = Projet.new
    @categories = list_categories
  end

  def edit
    @projet = Projet.find(params[:id])
    if @projet.contributeur == current_contributeur || current_animateur
      @categories = list_categories
    else
      render_403
    end
  end

  def update
    @projet = Projet.find(params[:id])
    if current_contributeur == @projet.contributeur || current_animateur
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
      Animateur.all.each do |animateur|
        AnimateurMailer.nouveau_projet(animateur, @projet).deliver_now
      end
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

  def destroy
    @projet = Projet.find(params[:id])
    @projet.destroy
    redirect_to animation_path
  end

  private

  def projet_params
    params.require(:projet)
      .merge(checked_statuts)
      .permit(:titre,
              :codepostal,
              :description,
              :categorie_id,
              :statut,
              :besoin,
              :localisation,
              :demarrage,
              :urlsite,
              :image)
  end

  def checked_statuts
    return {} unless params[:statut]
    string_of_values = params.require(:statut).map{ |key, val| key if val == "1" }.compact.join(";")
    {statut: string_of_values}
  end

  def list_categories
    Categorie.all.collect do |cat|
      [cat.nom, cat.id]
    end
  end
end
