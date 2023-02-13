class Sale < ApplicationRecord
  belongs_to :sale_person
  belongs_to :customer
end
