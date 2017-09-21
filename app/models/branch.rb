class Branch < ActiveRecord::Base
  belongs_to :company
  has_many :users
  
  validates :company_id,  presence: true
  validates :name,        presence: true, length: { maximum: 50 }
end
