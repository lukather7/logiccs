class Truck < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch

  mount_uploader :image, ImageUploader

  has_many :maintains
  has_many :truckhistories
  has_many :truckrelationships, foreign_key: :track_id, dependent: :destroy
  has_many :users, through: :truckrelationships

  has_many :loginotes

  validates :company_id, presence: true
  validates :branch_id, presence: true
  validates :maker,     presence: true, length: { maximum: 50 }
  validates :model,     presence: true, length: { maximum: 50 }
#  validates :body,      presence: true, length: { maximum: 50 }
  validates :wheels,    presence: true, numericality: { only_integer: true }
  validates :engine,    presence: true, length: { maximum: 20 }
  validates :vehicleid, presence: true, length: { maximum: 10 }
  validates :number,    presence: true, length: { maximum: 10 }
  validates :e_oil,     presence: true, numericality: { only_integer: true }
  validates :tm_oil,    presence: true, numericality: { only_integer: true }
  validates :df_oil,    presence: true, numericality: { only_integer: true }
  validates :tire,      presence: true, length: { maximum: 20 }
  validates :initmileage, presence: true,numericality: { only_integer: true }

  def user_add(userid)
    truckrelationships.find_or_create_by(user_id: userid)
  end

  def last_mileage
    hist = truckhistories.last
    hist != nil ? hist.mileage : 0
  end

  def next_mileage(cycle = 40000)
#    hist = truckhistories.order("action desc").first
#    last_mileage = (hist != nil) ? hist.mileage : 0
    booking = maintains.order("action desc").first
    im = (initmileage != nil) ? initmileage : 0
    (booking != nil) ?
      (((booking.next_mileage - im) / cycle) + 1 ) * cycle + im : cycle + im
  end

  def dummy
    "dummy string in model"
  end

end
