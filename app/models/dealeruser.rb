class Dealeruser < ActiveRecord::Base
  belongs_to :branch, class_name: "Dealerbranch"
  belongs_to :dealercompany

    has_secure_password

end
