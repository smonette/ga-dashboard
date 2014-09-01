class Shoutout < ActiveRecord::Base
  belongs_to :user
  validates :content, length: {:minimum => 6}, presence: true
end
