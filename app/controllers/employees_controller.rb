class EmployeesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create] #TODO Find a solution to this workaround
    before_action :set_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all
    end
    
    def new
        @employee = Employee.new
        @organization = Organization.find(params[:organization_id])
    end

    def create
        @employee = Employee.create(employee_params)
        if @employee && @employee.authenticate(params[:employee][:password])
            session[:employee_id] = @employee.id
            redirect_to employee_path(@employee) #TODO DRY this code
        else
            redirect_to login_path #TODO add flash message that login was denied
        end
    end

    def show
        @curr_user = current_user
        @assigned = @employee.assigned_tasks
        @completed = @employee.completed_tasks
    end

    def edit
        @curr_user = current_user
        if :project_lead? 
            render "edit"
        else
            return head(:forbidden)
        end
    end

    def update
        if :project_lead?
            @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            return head(:forbidden)
        end
    end

    def destroy
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :password, :email, :lead, :password_confirmation, :organization_id)
    end

    def set_employee
        @employee = Employee.find(params[:id])
    end

    def project_lead?
        current_user.lead == true
    end

   
end
