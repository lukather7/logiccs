class Truck < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :dealercompany

  mount_uploader :image, ImageUploader

  has_many :maintains, dependent: :destroy
  has_many :truckhistories, dependent: :destroy
  has_many :truckrelationships, dependent: :destroy
  has_many :users, through: :truckrelationships

  has_many :loginotes, dependent: :destroy
  has_many :tirehistories, dependent: :destroy
  
  has_many :adhocTruckRts, class_name: "AdhocTruckRt", dependent: :destroy
  has_many :adhocTrailerRts, class_name: "AdhocTrailerRt", dependent: :destroy
  

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
    booking = self.maintains.order("id").last
    im = (initmileage != nil) ? initmileage : 0
    temp_next = (booking != nil) ?
      (((booking.nextmileage - im) / cycle) + 1 ) * cycle + im : cycle + im
      
    check_next = (booking != nil) ? booking.nextmileage + cycle : cycle + im
    
    (check_next > temp_next) ? check_next : temp_next
  end

  def dummy
    "dummy string in model"
  end

end
