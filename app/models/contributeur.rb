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
  
  before_create :subscribe_to_newsletter

  scope :animateurs, -> { where(type: 'Animateur') }

  def subscribe_to_newsletter
    if newsletter
      gb = Gibbon::API.new(ENV["MAILCHIMP_API"])
      begin
        gb.lists.subscribe({
          :id => ENV['MAILCHIMP_LIST_ID'],
          :email => {:email => email},
          :double_optin => true
        })
        notice = "#{email} a bien été ajouté à la newsletter"
      rescue Gibbon::MailChimpError => e
        notice = e.message
      end
      logger.info notice
    end
  end

  def self.types
    %w( Animateur )
  end
end

