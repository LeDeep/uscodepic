class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :term

      t.timestamps
    end

    create_table :definitions do |t|
      t.text :text
      t.references :user
      t.references :word

      t.timestamps
    end    
  end
end
