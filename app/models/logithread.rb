class Logithread < ActiveRecord::Base
  belongs_to :dealercompany
  belongs_to :truck
  
  has_many :logiposts, dependent: :destroy
  
  belongs_to :admin, optional: true
  
  def has_confirmed?
    self.complete != nil
  end
  
end
