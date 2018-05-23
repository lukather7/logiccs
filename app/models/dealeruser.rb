class Dealeruser < ActiveRecord::Base
  belongs_to :dealerbranch
  belongs_to :dealercompany

    has_secure_password

end
