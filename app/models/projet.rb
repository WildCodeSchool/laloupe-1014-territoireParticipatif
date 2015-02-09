class Projet < ActiveRecord::Base
  has_many :commentaires
  validates_presence_of :titre, :objectif, :description
end
