class AddPullRequest < ActiveRecord::Migration
  def change
    add_column :words, :has_edits, :boolean, :default => false
    add_column :definitions, :current, :boolean, :default => false
  end
end
