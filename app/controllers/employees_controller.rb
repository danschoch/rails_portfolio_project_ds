class EmployeesController < ApplicationController
    before_action :require_login, only: [:index, :show, :edit, :update, :destroy] #TODO Find a solution to this workaround
    before_action :set_employee, only: [:show, :edit, :update, :destroy]
    before_action :set_user

    def index
        @employees = current_org_employees
    end
    
    def new
        @employee = Employee.new
        @organization = Organization.find(params[:organization_id])
    end

    def create
        @employee = Employee.new(employee_params)
        @organization = Organization.find(params[:organization_id]) if params[:organization_id]
        if @employee.save
            if !session[:employee_id] #if valid data && there is no existing employee_id in session hash (i.e. creating first employee for new organization)
                session[:employee_id] = @employee.id
                session[:organization_id] = @employee.organization_id
                redirect_to employee_path(@employee)
            else # same as above, but there is an existing employee_id in session hash (i.e. project lead is creating new employee)
                redirect_to employee_path(@employee) #TODO flash message that employee was successfully created
            end
        else
            render :new
        end
    end

    def show
        @assigned = @employee.assigned_tasks
        @completed = @employee.completed_tasks
        respond_to do |format|
            format.html { render :show }
            format.json { render json: @employee, status: 201}
        end
    end

    def edit
        if :project_lead?
            @organization = Organization.find(session[:organization_id]) 
            render "edit"
        else
            return head(:forbidden)
        end
    end

    def update
        @organization = Organization.find(session[:organization_id])
        if :project_lead?
            if @employee.update(employee_params)
                redirect_to employee_path(@employee)
            else
                render :edit
            end
        else
            return head(:forbidden)
        end
    end

    def destroy
        if :project_lead?
            @employee.tasks.each do |task|
                task.employee_id = nil
            end
            @employee.destroy
            redirect_to projects_path
        else
            return head(:forbidden)
        end
    end

    def month
        org = Organization.find(session[:organization_id])
        @emp_month = org.employees.most_completed_tasks
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :password, :email, :lead, :password_confirmation, :organization_id)
    end

    def set_employee
        @employee = Employee.find(params[:id])
        require_org_permission(@employee.organization_id)
    end

    def current_org_employees
        Employee.all.select {|emp| emp.organization_id == session[:organization_id]}
    end
   
end
