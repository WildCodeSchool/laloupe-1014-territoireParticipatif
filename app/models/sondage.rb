class Sondage < ActiveRecord::Base
  belongs_to :contributeur
  validates_presence_of :contributeur

  comma do
    profession
    contributeur :annee_naissance => 'Anné de naissance'
    contributeur :sexe => 'Sexe'
    contributeur :commune => 'Commune'
    contributeur :status => 'Résidence'
    equipement.to_s
    usage_fixe
    autre_usage_fixe
    usage_portable
    autre_usage_portable
    usage_tablette
    autre_usage_tablette
    usage_smartphone
    autre_usage_smartphone
    service
    commentaire_service
    competences
    formation "Souhaite bénéficier d'une formation"
    commentaire_formation
    prestataire "Connais des organismes de formation dans le Perche"
  end

end
