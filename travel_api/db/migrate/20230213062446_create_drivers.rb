class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.string :driver_license
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
