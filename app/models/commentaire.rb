class Commentaire < ActiveRecord::Base
  belongs_to :projet
  belongs_to :contributeur
  validates_presence_of :message
end
