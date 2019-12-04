class Trailerrelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :trailer
end
