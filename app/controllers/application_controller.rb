class ApplicationController < ActionController::Base
    def require_login
        return head(:forbidden) unless logged_in?
    end

    def logged_in?
        !!session[:employee_id]
    end

    def current_user
        Employee.find_by(id: session[:employee_id]) if logged_in?
    end
end
