class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name

      t.timestamps
    end

    create_table :user_skills do |t|
      t.references :user
      t.references :skill

      t.timestamps          
    end
  end
end
