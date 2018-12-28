class SessionsController < ApplicationController

    def create
        @employee = Employee.find_by(email: params[:employee][:email])
        if @employee && @employee.authenticate(params[:employee][:password])
            session[:employee_id] = @employee.id
            session[:organization_id] = @employee.organization_id
            redirect_to employee_path(@employee)
        else
            redirect_to login_path #TODO add flash message that login was denied
        end
    end

    def destroy
        session.delete :employee_id
        redirect_to root_path
    end

end