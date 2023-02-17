# frozen_string_literal: true

class CreateRouteCity < ActiveRecord::Migration[7.0]
  def change
    create_table :route_cities do |t|
      t.references :route, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.boolean :origin
      t.boolean :destination

      t.timestamps
    end
  end
end
