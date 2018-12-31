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

    def create_fb
        @employee = Employee.find_by(email: auth['info']['email'])
       
        if @employee
            session[:employee_id] = @employee.id
            session[:organization_id] = @employee.organization_id
            redirect_to employee_path(@employee)
        else
            redirect_to login_path #TODO add flash message that login was denied
        end
    end

    def destroy
        session.delete :employee_id
        session.delete :organization_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end