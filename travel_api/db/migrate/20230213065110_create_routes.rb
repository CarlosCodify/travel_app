# frozen_string_literal: true

class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :name
      t.decimal :price
      t.string :distance

      t.timestamps
    end
  end
end
