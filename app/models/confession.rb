class Confession < ActiveRecord::Base 
  # confession.user: confessioni yaratan user i veriyor.  
  belongs_to :user
  #confession.users: confessioni like eden userlari veriyor.
  has_many :likes
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { maximum: 600 } 
  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
end
