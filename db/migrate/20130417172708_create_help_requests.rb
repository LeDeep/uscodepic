class CreateHelpRequests < ActiveRecord::Migration
  def change
    create_table :help_requests do |t|
      t.string :subject
      t.text :details
      t.references :user

      t.timestamps
    end
  end
end
