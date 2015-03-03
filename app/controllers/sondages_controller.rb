class SondagesController < ApplicationController
before_action :authenticate_contributeur!, only: [:new, :create]
before_action :redirect_home, only: [:new, :create]

  def new
    @sondage = Sondage.new
  end

  def create
    @sondage = Sondage.new(sondage_params)
    @sondage.contributeur_id = current_contributeur.id
    @sondage.save
    redirect_to merci_path
  end

  private

  def sondage_params
    params.require(:sondage).permit(:created_at, :updated_at, :profession, :equipement, :usage_fixe, :usage_portable, :usage_tablette, :usage_smartphone, :service, :commentaire_service, :competences, :formation, :prestataire, :commentaire_prestataire, :contributeur_id)
  end

  def redirect_home
    if current_contributeur.sondage
      redirect_to root_path
    end
  end

end
