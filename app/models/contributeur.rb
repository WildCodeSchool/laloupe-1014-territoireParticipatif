class Contributeur < ActiveRecord::Base
  has_many :commentaires
  has_one :sondage
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projets
  has_many :likes
  validates_presence_of :pseudo, :nom, :prenom, :annee_naissance,
                        :commune, :status, :sexe
  validates_uniqueness_of :pseudo
  validates :charte, acceptance: {accept: true}

  scope :animateurs, -> { where(type: 'Animateur') }

  def self.types
    %w( Animateur )
  end
end

