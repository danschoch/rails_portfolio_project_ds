class ProjectsController < ApplicationController
    before_action :require_login
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only:[:index, :new, :edit, :show]

    def index
        @projects = Project.active_projects(Employee.find(session[:employee_id]).organization.id)
    end
    
    def new
        @project = Project.new
    end

    def create
        project = Project.create(project_params)
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
        if :project_lead?
            @project.tasks.each do |task|
                task.comments.each do |comment|
                    comment.destroy
                end
                task.destroy
            end
            @project.destroy
            redirect_to projects_path
        else
            return head(:forbidden)
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :due_date, :description, :organization_id, :lead_id)
    end

    def set_project
        @project = Project.find(params[:id])
        require_org_permission(@project.organization_id)
    end
end
