class AddUserRefernceToProjectUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_users, :user, foreign_key: true
  end
end
