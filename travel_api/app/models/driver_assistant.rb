# frozen_string_literal: true

class DriverAssistant < ApplicationRecord
  belongs_to :staff
  belongs_to :user
end
