class AddUserIdToWorkshopDate < ActiveRecord::Migration
  def change
    add_column :workshop_dates, :user_id, :integer
  end
end
