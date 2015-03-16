class Projet < ActiveRecord::Base
  belongs_to :categorie
  has_many :commentaires
  has_many :likes
  belongs_to :contributeur
  validates_presence_of :titre, :codepostal, :description, :contributeur, :categorie

  mount_uploader :image, ImageUploader

  def liked_by?(contributeur)
    if !contributeur || likes.empty?
      return false
    else
      likes.collect { |like| like.contributeur_id }.include? contributeur.id
    end
  end

  def abonnes
    abonnes = commentaires.map{ |commentaire| commentaire.contributeur }
    abonnes << contributeur
  end

  def self.echantillon(taille, exclus)
    (self.all - [exclus]).shuffle.last(taille)
  end
end
