class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :full_street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :region_id

      t.timestamps
    end
  end
end
