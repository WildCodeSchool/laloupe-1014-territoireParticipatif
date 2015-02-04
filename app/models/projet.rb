class Projet < ActiveRecord::Base
  validates_presence_of :titre, :objectif, :description
end
