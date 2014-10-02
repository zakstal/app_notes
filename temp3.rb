class User < ActiveRecord::Base
  attr_reader :password
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true}
end