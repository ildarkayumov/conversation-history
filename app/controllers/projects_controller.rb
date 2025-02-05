# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[edit update]

  def index
    @projects = Project.order(:created_at)
  end

  def new
    @project = Project.new
  end

  def edit
    authorize @project
  end

  def create
    @project = current_user.projects.create(project_params)

    if @project.persisted?
      respond_to do |format|
        format.html { redirect_back_or_to projects_path, notice: "Project was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Project was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @project

    if @project.update(project_params)
      respond_to do |format|
        format.html { redirect_back_or_to projects_path, notice: "Project was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Project was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
