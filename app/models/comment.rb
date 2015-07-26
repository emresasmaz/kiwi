class Comment < ActiveRecord::Base
  belongs_to :confession
  belongs_to :user
end
