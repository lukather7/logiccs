class Trailer < ActiveRecord::Base
  belongs_to :company
  belongs_to :branch
  belongs_to :dealercompany
  
  mount_uploader :image, ImageUploader
end
