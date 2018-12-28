class TasksController < ApplicationController
    before_action :require_login
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit]

    def index
        @task = Task.all
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
        if @curr_user.lead 
            render 'edit'
        else
            if @task.employee
                @task.employee = nil
                @task.save
            else
                @task.employee = @curr_user
                @task.save
            end
            redirect_to task_path(@task)
        end
    end

    def update
        @task.update(task_params)
        redirect_to task_params(@task)
    end

    def destroy
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
