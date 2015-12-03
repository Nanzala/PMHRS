class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions, id: :uuid, default: 'gen_random_uuid()', force:true do |t|
      t.uuid :record_id, null: false
      t.uuid :hospital_id, null: false

      t.timestamps null: false
    end
  end
end
