# frozen_string_literal: true

class VehicleModel < ApplicationRecord
  belongs_to :manufacturer
  has_many :year_manufacturers, dependent: :destroy
end
