class Actualite < ActiveRecord::Base
  belongs_to :animateur
  validates_presence_of :titre, :animateur
end
