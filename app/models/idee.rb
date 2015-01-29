class Idee < ActiveRecord::Base
  validates_presence_of :titre, :objectif, :description
end
