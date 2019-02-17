class Logithread < ActiveRecord::Base
  belongs_to :dealercompany
  belongs_to :truck
  
  has_many :logiposts
  
  def has_confirmed?
    self.complete != nil
  end
  
end
