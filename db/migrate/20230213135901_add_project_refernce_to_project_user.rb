class AddProjectRefernceToProjectUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :project_users, :project, foreign_key: true
  end
end
