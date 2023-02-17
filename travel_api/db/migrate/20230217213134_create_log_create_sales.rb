class CreateLogCreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :log_create_sales do |t|
      t.integer :sale_id
      t.integer :sale_person

      t.timestamps
    end
  end
end
