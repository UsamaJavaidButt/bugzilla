class AddUserRefernceToBug < ActiveRecord::Migration[7.0]
  def change
    add_reference :bugs, :user, foreign_key: true
  end
end
