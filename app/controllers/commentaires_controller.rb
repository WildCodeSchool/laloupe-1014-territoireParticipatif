class CommentairesController < ApplicationController
  before_action :authenticate_contributeur!, only: [:new, :create]
  before_action :authenticate_animateur!, only: [:edit, :update, :destroy]

  def new
    @projet = Projet.find(params[:projet_id])
    redirect_to @projet
  end

  def create
    @projet = Projet.find(params[:projet_id])
    @commentaire = @projet.commentaires.new(commentaire_params)
    @commentaire.contributeur_id = current_contributeur.id
    if @commentaire.save
      ### envoyer un email à la liste des abonnés
      notifies = @projet.abonnes - [current_contributeur]
      notifies.each do |destinataire|
        ContributeurMailer.nouveau_commentaire(destinataire, @commentaire).deliver_now
      end
      ###
      redirect_to projet_path @projet
    else
      redirect_to projet_path @projet
    end
  end

  def edit
    @commentaire = Commentaire.find(params[:id])
  end

  def update
    @commentaire = Commentaire.find(params[:id])
    @projet = @commentaire.projet
    if @commentaire.update(commentaire_params)
      redirect_to @projet
    else
      render :edit
    end
  end

  def destroy
    @commentaire = Commentaire.find(params[:id])
    @commentaire.destroy
    redirect_to animation_path
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:message)
  end
end
