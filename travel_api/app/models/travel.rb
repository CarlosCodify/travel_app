# frozen_string_literal: true

class Travel < ApplicationRecord
  enum status: %i[open in_process closed]

  belongs_to :bus
  belongs_to :route
  belongs_to :driver, optional: true
  belongs_to :driver_assistant, optional: true
  has_many :seats, dependent: :destroy
  has_many :sales
end
