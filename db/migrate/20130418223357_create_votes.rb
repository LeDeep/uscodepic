class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :up_down, :integer
      t.column :definition_id, :integer
      t.references :votable, :polymorphic => true

      t.timestamps
    end
  end
end
