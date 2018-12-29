class TasksController < ApplicationController
    before_action :require_login
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit]

    def index
        @tasks = Project.find(params[:project_id]).tasks
    end
    
    def new
        @task =Task.new
    end

    def create
        @task = Task.create(task_params)
        redirect_to task_path(@task)
    end

    def show
        @comment = Comment.new
        @comments = @task.comments.all
    end

    def edit
        if :project_lead?
            render 'edit'
        else
            if !@task.employee.nil?
                @task.employee_id = nil
                @task.update
                redirect_to task_path(@task)
            else
                @task.employee_id = @curr_user.id
                @task.update
                redirect_to(@task)
            end
        end
    end

    def update
        @task.update(task_params)
        redirect_to task_params(@task)
    end

    def destroy
        if :project_lead?
            @task.comments.each do |comment|
                comment.destroy
            end
            @task.destroy
            redirect_to project_path(@task.project)
        else
            return head(:forbidden)
        end
    end

    private

    def task_params
        params.require(:task).permit(:content, :lead_notes, :completed, :employee_id, :project_id)
    end

    def set_task
        @task = Task.find(params[:id])
        require_org_permission(@task.project.organization_id)
    end
end
