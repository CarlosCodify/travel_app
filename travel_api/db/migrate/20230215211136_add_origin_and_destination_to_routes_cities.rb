# frozen_string_literal: true

class AddOriginAndDestinationToRoutesCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities_routes, :origin_id, :integer
    add_column :cities_routes, :destination_id, :integer
  end
end
