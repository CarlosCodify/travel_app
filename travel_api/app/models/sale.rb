# frozen_string_literal: true

class Sale < ApplicationRecord
  belongs_to :sale_person
  belongs_to :customer
end
