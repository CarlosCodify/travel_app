# frozen_string_literal: true

class Person < ApplicationRecord
  has_one :driver, dependent: :destroy
  has_one :sale_person, dependent: :destroy
  has_one :driver_assistant, dependent: :destroy
  has_one :customer, dependent: :destroy
  has_one :staff, dependent: :destroy
end
