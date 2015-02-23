class Projet < ActiveRecord::Base
  belongs_to :categorie
  has_many :commentaires
  has_many :likes
  belongs_to :contributeur
  validates_presence_of :titre, :objectif, :description, :contributeur

  def liked_by?(contributeur)
    if likes.empty?
      return false
    else
      likes.collect { |like| like.contributeur_id }.include? contributeur.id
    end
  end
end
