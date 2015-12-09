class ChangeIdToIntegerOnPermissions < ActiveRecord::Migration
  def change
    remove_column :permissions, :id, :uuid
    add_column :permissions, :id, :integer, primary_key: true   
  end
end
