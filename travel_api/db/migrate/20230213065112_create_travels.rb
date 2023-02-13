class CreateTravels < ActiveRecord::Migration[7.0]
  def change
    create_table :travels do |t|
      t.date :departure_time
      t.date :arrival_time
      t.string :departure_city
      t.string :arrival_city
      t.string :status
      t.references :bus, null: false, foreign_key: true
      t.references :route, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.references :driver_assistant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
