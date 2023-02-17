# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :sale
  belongs_to :customer
  belongs_to :seat
  before_validation :generate_serial_number, on: :create

  private

  def generate_serial_number
    self.serial_number = SecureRandom.uuid
  end
end
