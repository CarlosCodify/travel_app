# frozen_string_literal: true

class Manufacturer < ApplicationRecord
  has_many :vehicle_models, dependent: :destroy
end
