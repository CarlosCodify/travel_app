# frozen_string_literal: true

class MakeDriverAndAssistantOptionalInTravel < ActiveRecord::Migration[7.0]
  def change
    change_column_null :travels, :driver_id, true
    change_column_null :travels, :driver_assistant_id, true
  end
end
