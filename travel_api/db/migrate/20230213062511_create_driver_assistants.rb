# frozen_string_literal: true

class CreateDriverAssistants < ActiveRecord::Migration[7.0]
  def change
    create_table :driver_assistants do |t|
      t.references :staff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
