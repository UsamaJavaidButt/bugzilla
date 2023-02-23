class RemoveCreatorIdFromBugs < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :creator_id, :integer
  end
end
