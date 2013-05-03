class RenameNameColumns < ActiveRecord::Migration
  def change
  	rename_column :subjects, :name, :category
  	rename_column :types, :name, :format
  end
end
