# frozen_string_literal: true

class RenameTypeColumnInBuses < ActiveRecord::Migration[7.0]
  def change
    rename_column :buses, :type, :bus_type
  end
end
