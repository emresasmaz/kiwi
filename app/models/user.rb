class User < ActiveRecord::Base
  has_many :confessions
  validates :username, length: { minimum: 5, maximum: 25 }
  validates :password, length: { minimum: 6, maximum: 25 }
end