class Sondage < ActiveRecord::Base
  belongs_to :contributeur
  validates_presence_of :contributeur
end
