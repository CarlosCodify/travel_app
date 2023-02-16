# frozen_string_literal: true

class SalePerson < ApplicationRecord
  belongs_to :staff
  belongs_to :user
end
