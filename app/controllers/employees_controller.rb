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
            #if !session[:employee_id]
                #@organization.destroy
                #render 'static_pages/signup'
            #else
                render :new
            #end (actually dont think I need this if statement... same page renders regardless)
        end
=begin
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
=end
    end

    def show
        @assigned = @employee.assigned_tasks
        @completed = @employee.completed_tasks
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
