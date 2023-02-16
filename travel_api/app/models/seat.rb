# frozen_string_literal: true

class Seat < ApplicationRecord
  belongs_to :bus
  belongs_to :travel

  after_initialize :default_values, if: :new_record?

  def busy!
    self.availability = false
    save!
  end

  def default_values
    self.availability ||= true
  end
end
