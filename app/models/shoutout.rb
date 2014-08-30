class Shoutout < ActiveRecord::Base
  belongs_to :user
  validates :content, length {:mininum => 6}, presence: true
end
