class CreateWorkshopDates < ActiveRecord::Migration
  def change
    create_table :workshop_dates do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :workshop_id
      t.date :start_date

      t.timestamps
    end
  end
end
