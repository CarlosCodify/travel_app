class Travel < ApplicationRecord
  belongs_to :bus
  belongs_to :route
  belongs_to :driver
  belongs_to :driver_assitant
end
