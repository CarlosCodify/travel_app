# frozen_string_literal: true

class CreateSalePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :sale_people do |t|
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
