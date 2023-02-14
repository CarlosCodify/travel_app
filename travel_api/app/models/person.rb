# frozen_string_literal: true

class Person < ApplicationRecord
  has_one :customer, dependent: :destroy
  has_one :staff, dependent: :destroy
end
