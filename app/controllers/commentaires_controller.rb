class CommentairesController < ApplicationController
  before_action :authenticate_contributeur!
  def new
    @commentaire = Commentaire.new
  end

  def create
    @projet = Projet.find(params[:projet_id])
    @commentaire = @projet.commentaires.new(commentaire_params)
    @commentaire.contributeur_id = current_contributeur.id
    if @commentaire.save
      redirect_to projet_path @projet
    else
      render :new
    end
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:message)
  end
end
