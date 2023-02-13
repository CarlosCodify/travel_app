# frozen_string_literal: true

class CreateCityRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :city_routes do |t|
      t.belongs_to :city
      t.belongs_to :route

      t.timestamps
    end
  end
end
