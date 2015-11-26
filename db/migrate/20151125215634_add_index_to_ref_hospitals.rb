class AddIndexToRefHospitals < ActiveRecord::Migration
  def change
      add_index :hospitals, :ref
  end
end
