class AddStatusToBug < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :status, :integer, default:0
  end
end
