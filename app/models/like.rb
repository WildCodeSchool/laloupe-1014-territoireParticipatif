class Like < ActiveRecord::Base
  belongs_to :projet
  belongs_to :contributeur
end
