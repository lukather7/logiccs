class Truckrelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  
  validates :user_id, presence: true
  validates :truck_id, presence: true
end
