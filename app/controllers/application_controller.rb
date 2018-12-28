class ApplicationController < ActionController::Base
    def logged_in?
        !!session[:employee_id]
    end
    
    def require_login
        return head(:forbidden) unless logged_in?
    end

    def current_user
        Employee.find_by(id: session[:employee_id]) if logged_in?
    end

    def set_user
        @curr_user = current_user
    end

    def in_organization?(org_id)
        org_id == session[:organization_id]
    end

    def require_org_permission(org_id)
        return head(:forbidden) if !in_organization?(org_id)
    end
end
