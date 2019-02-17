class Logipost < ActiveRecord::Base
  belongs_to :logithread
  belongs_to :dealeruser
end
