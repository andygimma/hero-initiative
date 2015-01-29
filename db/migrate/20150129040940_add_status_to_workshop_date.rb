class AddStatusToWorkshopDate < ActiveRecord::Migration
  def change
    add_column :workshop_dates, :status, :string, null: false, default: "pending"
  end
end
