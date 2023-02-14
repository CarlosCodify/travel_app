# frozen_string_literal: true

class Staff < ApplicationRecord
  belongs_to :person
  has_one :driver, dependent: :destroy
  has_one :sale_person, dependent: :destroy
  has_one :driver_assistant, dependent: :destroy
end
