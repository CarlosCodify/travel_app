# frozen_string_literal: true

class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :type
      t.integer :total_seats
      t.integer :available_seats
      t.string :status
      t.references :year_manufacturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
