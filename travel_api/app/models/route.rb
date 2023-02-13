# frozen_string_literal: true

class Route < ApplicationRecord
  has_and_belongs_to_many :cities
end
