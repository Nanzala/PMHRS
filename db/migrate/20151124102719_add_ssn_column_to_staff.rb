class AddSsnColumnToStaff < ActiveRecord::Migration
    def change
        add_column :staffs, :ssn, :string, unique: true, null: false
        add_index :staffs, :ssn
    end
end
