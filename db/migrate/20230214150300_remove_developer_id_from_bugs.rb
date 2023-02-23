class RemoveDeveloperIdFromBugs < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :developer_id, :integer
  end
end
