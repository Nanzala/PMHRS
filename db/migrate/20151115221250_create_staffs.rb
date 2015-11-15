class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs, id:false do |t|
      t.string :id, null:false
      t.string :name
      t.string :role
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
    add_index :staffs, :id, unique:true
  end
end
