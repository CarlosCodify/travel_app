# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :customers, dependent: :destroy
  has_many :staffs, dependent: :destroy
end
