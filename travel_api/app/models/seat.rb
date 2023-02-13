class Seat < ApplicationRecord
  belongs_to :bus
  belongs_to :travel
end
