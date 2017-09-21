class Loginote < ActiveRecord::Base
  belongs_to :truck
  validates :truck_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
