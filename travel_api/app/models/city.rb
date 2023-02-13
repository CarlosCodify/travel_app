# frozen_string_literal: true

class City < ApplicationRecord
  has_and_belongs_to_many :routes
end
