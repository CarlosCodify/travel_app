# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :route_cities
  has_many :cities, through: :route_cities
end
