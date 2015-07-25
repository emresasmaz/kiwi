class User < ActiveRecord::Base
  has_many :confessions
  has_many :likes
  validates :username, length: { minimum: 5, maximum: 25 }, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 25 }, confirmation: true
end
