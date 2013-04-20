class NewTableType < ActiveRecord::Migration
  def change
    create_table(:types) do |t|
      t.string :name
      t.timestamp
    end
  end
end
