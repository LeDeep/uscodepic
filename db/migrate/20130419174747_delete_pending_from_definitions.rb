class DeletePendingFromDefinitions < ActiveRecord::Migration
  def up
    remove_column :definitions, :pending
  end

  def down
    add_column :definitions, :pending, :boolean
  end
end
