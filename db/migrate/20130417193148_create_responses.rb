class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :message
      t.references :help_request
      t.references :user
      
      t.timestamps
    end
  end
end
