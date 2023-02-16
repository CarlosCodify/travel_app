# frozen_string_literal: true

class ChangesColumnStatusToTravel < ActiveRecord::Migration[7.0]
  def change
    change_column :travels, :status, :integer, using: 'status::integer'
  end
end
