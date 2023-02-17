# frozen_string_literal: true

class ChangeStatusInBuses < ActiveRecord::Migration[7.0]
  def change
    change_column :buses, :status, 'integer USING CAST(type AS integer)'
  end
end
