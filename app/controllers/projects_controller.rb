class ProjectsController < ApplicationController
    before_action :require_login
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only:[:index, :new, :edit]

    def index
        @projects = Project.active_projects(Employee.find(session[:employee_id]).organization.id)
    end
    
    def new
        @project = Project.new
    end

    def create
        project = Project.create(project_params)
        # add current organization to @project.organization_id
        # add lead_id association
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
