class Ticket < ApplicationRecord
  belongs_to :sale
  belongs_to :customer
  belongs_to :seat
end