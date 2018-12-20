class SessionsController < ApplicationController

    def new
        @employee = Employee.find(1)
    end

    def create
        @employee = Employee.find_by(email: params[:employee][:email])
        binding.pry
        return head(:forbidden) unless @employee.authenticate(params[:employee][:password])
        session[:employee_id] = @employee.id
        redirect_to employee_path(@employee)
    end

end