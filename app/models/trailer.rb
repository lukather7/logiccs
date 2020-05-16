class Trailer < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :dealercompany
  
  mount_uploader :image, ImageUploader
  
  
  has_many :tirehistories, class_name: "Trailertirehistory"
  has_many :adhocTrailerRts, class_name: "AdhocTrailerRt", dependent: :destroy

end
