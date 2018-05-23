class Dealerbranch < ActiveRecord::Base
  belongs_to :dealercompany
  
  validates :dealercompany_id, presence: true
  validates :name,    presence: true, length: { maximum: 75 }

end
