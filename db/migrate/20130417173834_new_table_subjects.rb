class NewTableSubjects < ActiveRecord::Migration
  def change
    create_table(:subjects) do |t|
      t.string :name
      t.timestamp
    end
  end
end
