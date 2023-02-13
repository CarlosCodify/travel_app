class CreateSalePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_people do |t|
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
