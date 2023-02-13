# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :identity_document
      t.boolean :status
      t.date :birthday

      t.timestamps
    end
  end
end
