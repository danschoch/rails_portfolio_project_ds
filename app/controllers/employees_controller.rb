class EmployeesController < ApplicationController

    def index
    end
    
    def new
    end

    def create
    end

    def show
        @employee = Employee.find(params[:id])
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
end
