class CreateCampingTrips < ActiveRecord::Migration
  def change
    create_table :camping_trips do |t|
      t.string :date_camped
      t.string :park
      t.string :campground
      t.string :notes
      t.integer :camper_id
    end
  end
end
