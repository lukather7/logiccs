class Company < ActiveRecord::Base
    has_many :users, dependent: :destroy
    has_many :branches, dependent: :destroy
    
  validates :name_e,    presence: true, length: { maximum: 50 }
  validates :name_j,    presence: true, length: { maximum: 50 }

end
