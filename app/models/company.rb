class Company < ActiveRecord::Base
    has_many :users
    has_many :branches
    
  validates :name_e,    presence: true, length: { maximum: 50 }
  validates :name_j,    presence: true, length: { maximum: 50 }

end
