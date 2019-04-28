class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def create
    @workflow = CreatesProject.new(
      name: params[:project][:ingredients],
      ingredients_string: params[:project][:ingredients]
    )
    @workflow.create
    redirect_to projects_path
  end
end
