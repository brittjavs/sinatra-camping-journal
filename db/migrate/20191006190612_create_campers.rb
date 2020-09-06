class CreateCampers < ActiveRecord::Migration
  def change
    create_table :campers do |t|
      t.string :email
      t.string :password_digest
      t.string :username
    end
  end
end
