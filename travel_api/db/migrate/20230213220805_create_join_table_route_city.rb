class CreateJoinTableRouteCity < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cities, :routes
  end
end
