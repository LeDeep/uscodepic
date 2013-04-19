class AddColumnDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :pending, :boolean, :default => true
  end
end
