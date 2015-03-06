class Actualite < ActiveRecord::Base
  belongs_to :animateur
  validates_presence_of :titre, :animateur, :image
  validates :image, format: { with: /\Ahttp/, message: "Entrez un lien valide"}
end
