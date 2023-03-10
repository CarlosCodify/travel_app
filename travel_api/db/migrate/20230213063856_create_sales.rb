# frozen_string_literal: true

class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.decimal :total_amount
      t.string :unitary_amount
      t.references :sale_person, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
