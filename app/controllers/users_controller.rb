class UsersController < ApplicationController
  def index
    @project = Project.find(params[:project_id])

    @project = Project.find(params[:project_id])
    @users_added = @project.users

    @users_not_added = User.all.where.not(id: @users_added.pluck(:id))
  end

  def add_user
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])

    ProjectUser.create!(project_id: params[:project_id], user_id: params[:user_id])
    @project = Project.find(params[:project_id])
    @user = @project.users

    redirect_to project_users_path, notice: 'User status has been updated.'
  end

  def remove_user
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    ProjectUser.find_by(project_id: params[:project_id], user_id: params[:user_id]).destroy

    redirect_to project_users_path, notice: 'User remove has been updated.'
  end
end
