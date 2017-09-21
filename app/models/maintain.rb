class Maintain < ActiveRecord::Base
  belongs_to :truck
  
  validates :truck_id,  presence: true
  validates :action,    presence: true
  validates :mileage,       presence: true, numericality: { only_integer: true }
  validates :nextmileage,   presence: true, numericality: { only_integer: true }
  validates :content,   length: { maximum: 140 }

end
