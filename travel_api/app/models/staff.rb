# frozen_string_literal: true

class Staff < ApplicationRecord
  has_one :driver
  has_one :sale_person
  has_one :driver_assistant

  belongs_to :person
end
