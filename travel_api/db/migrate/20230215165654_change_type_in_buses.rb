# frozen_string_literal: true

class ChangeTypeInBuses < ActiveRecord::Migration[7.0]
  def change
    change_column :buses, :type, 'integer USING CAST(type AS integer)'
  end
end
