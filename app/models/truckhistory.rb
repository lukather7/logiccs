class Truckhistory < ActiveRecord::Base
#  attr_accessible :action
  belongs_to :truck
  
  validates :truck_id,  presence: true
  validates :mileage,   numericality: {only_integer: true}
end
