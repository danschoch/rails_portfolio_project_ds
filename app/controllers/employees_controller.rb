class EmployeesController < ApplicationController
    before_action :require_login
    before_action :set_employee, only: [:show, :edit, :update, :destroy]

    def index
        @employees = Employee.all
    end
    
    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.create(employee_params)
        # add current organization to @employee.organization_id
        redirect_to employee_path(@employee)
    end

    def show
    end

    def edit
    end

    def update
        @employee.update(employee_params)
    end

    def destroy
    end

    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :password, :email, :lead)
    end

    def set_employee
        @employee = Employee.find(params[:id])
    end
end
