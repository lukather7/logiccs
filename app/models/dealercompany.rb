class Dealercompany < ActiveRecord::Base
      validates :name,    presence: true, length: { maximum: 75 }
      
      has_many :dealerbranches
end
