class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end
    
    def new
        @project = Project.new
    end

    def create
        project = Project.create(project_params)
        # add current organization to @project.organization_id
        redirect_to project_path(project)
    end

    def show
    end

    def edit
    end

    def update
        redirect_to project_path(@project)
    end

    def destroy
    end

    private

    def project_params
        params.require(:project).permit(:name, :due_date, :description, :organization_id, :lead_id)
    end

    def set_project
        @project = Project.find(params[:id])
    end
end
