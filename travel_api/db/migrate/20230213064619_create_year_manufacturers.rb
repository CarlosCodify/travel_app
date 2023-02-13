class CreateYearManufacturers < ActiveRecord::Migration[7.0]
  def change
    create_table :year_manufacturers do |t|
      t.string :year
      t.references :vehicle_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end
