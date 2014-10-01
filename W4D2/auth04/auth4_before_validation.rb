require 'digest/sha2'

class User <ActiveRecord::Base
  attr_readr :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, lenght: { miinimum: 6, allow_nil: ture }

  before_validation :ensure_session_token

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

before_validation