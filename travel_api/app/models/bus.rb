# frozen_string_literal: true

class Bus < ApplicationRecord
  enum bus_type: %i[normal semi_bed bed]
  enum status: %i[available on_route out_of_service]

  belongs_to :year_manufacturer
  before_save :set_available_seats_default

  delegate :vehicle_model, to: :year_manufacturer
  delegate :manufacturer, to: :vehicle_model

  def description
    "#{manufacturer.name} #{vehicle_model.name} (#{year_manufacturer.year})"
  end

  private

  def set_available_seats_default
    self.available_seats ||= total_seats
  end
end
