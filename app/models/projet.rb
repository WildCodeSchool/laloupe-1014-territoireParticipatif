class Projet < ActiveRecord::Base
  belongs_to :categorie
  has_many :commentaires
  belongs_to :contributeur
  validates_presence_of :titre, :objectif, :description
end
