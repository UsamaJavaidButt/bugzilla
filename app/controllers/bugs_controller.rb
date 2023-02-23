class BugsController < ApplicationController
  load_and_authorize_resource except: %i[index new create]

  def index
    @bugs = Bug.all.where(project_id: params[:project_id])
  end

  def new
    @bug = Bug.new
    @statuses = Bug.statuses.keys
    @assign_to = []
    @project = Project.find(params[:project_id])
    @assign_to = @project.users.where(user_type: 'Developer')
  end

  def create
    debugger
    bug_params = params.require(:bug).permit(:title, :description, :deadline, :type_value, :status, :avatar,
                                             :project_id, :creator_id, :developer_id)
    @bug = Bug.new(bug_params)

    puts "@bug: #{bug_params.inspect}"
    @bug.project_id = params[:project_id]
    @bug.creator_id = current_user.id
    @assign_to = []
    @project = Project.find(params[:project_id])
    @assign_to = @project.users.where(user_type: 'Developer')

    respond_to do |format|
      if @bug.save
        format.html { redirect_to project_bugs_path, notice: 'Your bug is now live.' }
      else
        format.html { render :new, status: :unprocessable_entity, content_type: 'text/html' }
      end
    end
  end

  def edit
    @bug = Bug.find(params[:id])
    @assign_to = []
    @project = Project.find(params[:project_id])
    @assign_to = @project.users.where(user_type: 'Developer')
  end

  def update
    @bug = Bug.find(params[:id])
    @assign_to = []
    @assign_to = User.all.where(user_type: 'Developer')

    respond_to do |format|
      if @bug.update((params.require(:bug).permit(:title, :description, :deadline, :type_value, :status, :avatar,
                                                  :project_id, :creator_id, :developer_id)))

        format.html { redirect_to project_bugs_path, notice: 'The bug is  successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity, content_type: 'text/html' }
      end
    end
  end

  def show
    @bugs = Bug.find(params[:id])
  end

  def destroy
    @bug = Bug.find(params[:id])
    # Destroy/delete the record
    @bug.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to project_bugs_path, notice: 'Bug was removed.' }
    end
  end

  def assign_to
    @assign_to = []
    @project = Project.find(params[:project_id])
    @assign_to = @project.users.where(user_type: 'Developer')
  end

  def update_status_dropdown
    type_value = params[:type_value]
    statuses = if type_value == 'Bug'
                 Bug.statuses.slice(:new, :started, :completed).keys
               else
                 Bug.statuses.slice(:new, :started, :resolved).keys
               end
    render json: statuses
  end
end
