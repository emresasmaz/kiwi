class Confession < ActiveRecord::Base 
  belongs_to :user
  validates :content, presence: true, length: { maximum: 300 } 
  validates :title, presence: true, length: { minimum: 4, maximum: 50 }
end
