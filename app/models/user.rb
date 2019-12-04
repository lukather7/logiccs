class User < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  has_many :truckrelationships, foreign_key: :user_id, dependent: :destroy
  has_many :trucks, through: :truckrelationships, dependent: :destroy

  has_many :trailerrelationships, foreign_key: :user_id, dependent: :destroy
  has_many :trailers, through: :trailerrelationships, dependent: :destroy


  before_save { self.email = self.email.downcase }
  
  validates :company_id,  presence: true
  validates :branch_id,   presence: true
  validates :name,        presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,       presence: true, length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
  has_secure_password
  
  def truck_add(truckid)
    truckrelationships.find_or_create_by(truck_id: truckid)
  end
  
  def truck_include?(truck)
    self.trucks.include?(truck)
  end


  def trailer_add(trailerid)
    trailerrelationships.find_or_create_by(trailer_id: trailerid)
  end

  def trailer_include?(trailer)
    self.trailers.include?(trailer)
  end
    
  
  
end
