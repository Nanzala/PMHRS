class AddChangesToDbEntities < ActiveRecord::Migration
    def change
        add_reference :records, :record, foreign_key: true, type: :uuid
    end
end
