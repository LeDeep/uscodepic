class ChangeTableResourcesToTools < ActiveRecord::Migration
  def change
    rename_table :tools, :tools
  end
end
