class Robot < ActiveRecord::Base
  validates :robot_name, presence: true
end
