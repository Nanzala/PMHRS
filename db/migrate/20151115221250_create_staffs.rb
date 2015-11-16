class CreateStaffs < ActiveRecord::Migration
  def change
      create_table :staffs, id: :uuid, default: 'gen_random_uuid()', force:true do |t|
      t.string :name
      t.string :role
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end
