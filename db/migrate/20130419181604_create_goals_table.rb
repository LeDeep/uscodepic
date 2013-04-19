class CreateGoalsTable < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :status
      t.integer :user_id
      t.integer :tool_id
      
      t.timestamps
    end
  end
end
