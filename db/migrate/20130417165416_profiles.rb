class Profiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :bio
      t.integer :user_id

      t.timestamps
    end
  end
end
