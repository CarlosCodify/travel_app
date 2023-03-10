# frozen_string_literal: true

class CreateVehicleModels < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_models do |t|
      t.string :name
      t.references :manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
