# frozen_string_literal: true

class AddUserToDriverAssistantDriverAndSalePerson < ActiveRecord::Migration[7.0]
  def change
    add_reference :driver_assistants, :user, foreign_key: true
    add_reference :drivers, :user, foreign_key: true
    add_reference :sale_people, :user, foreign_key: true
  end
end
