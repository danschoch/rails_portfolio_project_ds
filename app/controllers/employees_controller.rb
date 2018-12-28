class EmployeesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create] #TODO Find a solution to this workaround
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def index
        @employees = Employee.all
    end
    
    def new
        @employee = Employee.new
        @organization = Organization.find(params[:organization_id])
    end

    def create
        @employee = Employee.create(employee_params)
        if !session[:employee_id]
            if @employee && @employee.authenticate(params[:employee][:password])
                session[:employee_id] = @employee.id
                session[:organization_id] = @employee.organization_id
                redirect_to employee_path(@employee) #TODO DRY this code
            else
                redirect_to login_path #TODO add flash message that login was denied
            end
        else
            if @employee && @employee.authenticate(params[:employee][:password])
                redirect_to employee_path(@employee)
            else
                redirect_to employee_path(@curr_user) #TODO: add flash message that new employee was not created
            end
        end

    end

    def show
        @assigned = @employee.assigned_tasks
        @completed = @employee.completed_tasks
    end

    def edit
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
        require_org_permission(@employee.organization_id)
    end

    def project_lead?
        current_user.lead == true
    end

   
end
