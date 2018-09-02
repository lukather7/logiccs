class Sendbooking < ActiveRecord::Base
  belongs_to :user
  belongs_to :truck
  
  has_one :bookinglaborcost
  has_one :bookingpartscost
  accepts_nested_attributes_for :bookinglaborcost, :bookingpartscost

end
