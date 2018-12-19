class EmployeesController < ApplicationController
    before_action :set_employee, only: [:show, :edit, :update]

    def index
    end
    
    def new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def employee_params
        params.require().permit
    end

    def set_employee
        @employee = Employee.find(params[:id])
    end
end
