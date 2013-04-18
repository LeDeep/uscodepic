class AddClosedStatusToRequests < ActiveRecord::Migration
  def change
    add_column :help_requests, :closed, :boolean
  end
end
