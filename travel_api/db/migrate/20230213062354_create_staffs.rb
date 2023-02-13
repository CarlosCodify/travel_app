class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
