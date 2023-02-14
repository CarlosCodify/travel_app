# frozen_string_literal: true

class Driver < ApplicationRecord
  validates :driver_licence, presence: true

  belongs_to :staff
end
