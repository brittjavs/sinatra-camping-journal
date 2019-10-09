class AddVisitedColumn < ActiveRecord::Migration
  def change
    add_column :camping_trips, :visited, :boolean, default: true
  end
end
