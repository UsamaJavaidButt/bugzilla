class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    authorize! :create, @projects
    @project = Project.new
  end

  def create
    @project = Project.new(params.require(:project).permit(:title))

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Your project is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    authorize! :update, @projects
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update(params.require(:project).permit(:title))
        format.html { redirect_to projects_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @bugs = Bug.all.where(project_id: @project.id)

    # @bugs=Bug.all
  end

  def destroy
    authorize! :destroy, @projects
    @project = Project.find(params[:id])
    # Destroy/delete the record
    @project.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to projects_path, notice: 'Record was removed.' }
    end
  end
end
