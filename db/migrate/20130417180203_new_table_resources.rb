class NewTableResources < ActiveRecord::Migration
  def change
    create_table(:tools) do |t|
      t.string :name
      t.integer :type_id
      t.integer :subject_id
      t.string :cost
      t.string :level
      t.string :location

      t.timestamp
    end
  end
end
