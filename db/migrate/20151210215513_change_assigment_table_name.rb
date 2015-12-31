class ChangeAssigmentTableName < ActiveRecord::Migration
  def change
      rename_table :assingments, :hospitals_staffs
  end
end
