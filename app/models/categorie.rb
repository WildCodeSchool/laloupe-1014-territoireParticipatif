class Categorie < ActiveRecord::Base
  has_many :projets
  validates_presence_of :nom
end
