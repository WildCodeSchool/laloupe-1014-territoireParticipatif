class Contributeur < ActiveRecord::Base
  has_many :commentaires
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projets
  has_many :likes
  validates_presence_of :pseudo
  validates_uniqueness_of :pseudo
end
