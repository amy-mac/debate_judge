class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation, :remember_token

  has_many :tournaments
  has_many :rounds, through: :tournaments
  has_many :contentions, through: :rounds

  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save :create_remember_token

  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: valid_email_regex },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, :presence => { :if => :password }

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
