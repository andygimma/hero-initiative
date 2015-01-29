class AddStatusToWorkshop < ActiveRecord::Migration
  def change
    add_column :workshops, :status, :string, null: false, default: "pending"
  end
end
