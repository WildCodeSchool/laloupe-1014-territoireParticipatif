class Like < ActiveRecord::Base
  belongs_to :projet
  belongs_to :contributeur
  validates_presence_of :contributeur, :projet
  validates_uniqueness_of :contributeur, scope: :projet
end
