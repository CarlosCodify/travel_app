# frozen_string_literal: true

class DropCitiesRoutesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :cities_routes
  end
end
