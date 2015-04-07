class SondagesController < ApplicationController
before_action :authenticate_contributeur!, only: [:new, :create]
before_action :authenticate_animateur!, only: [:export]
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

  def export
    respond_to do |format|
      format.csv { render csv: Sondage.all, filename: "reponses_sondage_#{Time.now.strftime('%F-%Hh%Mm%Ss')}" }
    end
  end

  private

  def params_to_string
    params.require(:sondage).transform_values do |valeur|
      if valeur.class == Array
        valeur.join(';')
      else
        valeur
      end
    end
  end

  def sondage_params
    params_to_string.permit(
      :created_at,
      :updated_at,
      :profession,
      :equipement,
      :usage_fixe,
      :usage_portable,
      :usage_tablette,
      :usage_smartphone,
      :service,
      :commentaire_service,
      :competences,
      :formation,
      :commentaire_formation,
      :prestataire,
      :commentaire_prestataire,
      :contributeur_id,
      :autre_usage_fixe,
      :autre_usage_portable,
      :autre_usage_tablette,
      :autre_usage_smartphone,
    )
  end

  def redirect_home
    if current_contributeur.sondage
      redirect_to root_path, notice: "Vous avez déjà répondu à ce sondage, nous vous tiendrons informé des résultats"
    end
  end

end
