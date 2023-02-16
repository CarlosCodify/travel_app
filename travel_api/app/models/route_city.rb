# frozen_string_literal: true

class RouteCity < ApplicationRecord
  belongs_to :route
  belongs_to :city
end
