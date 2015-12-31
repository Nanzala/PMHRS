class CreateStaffSignups < ActiveRecord::Migration
  def change
    create_table :staff_signups do |t|
      t.string :email
      t.string :confirmation_token

      t.timestamps null: false
    end
    add_index :staff_signups, :email, unique: true
  end
end
