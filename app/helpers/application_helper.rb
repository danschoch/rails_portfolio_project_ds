module ApplicationHelper

    # To be used for task and project due dates
    def due_date_formatted(obj)
        obj.due_date.strftime("%A, %b %e") if obj.due_date
    end

    def curr_employee
        Employee.find(session[:employee_id])
    end

    def curr_employee_name
        curr_employee.first_name
    end

end
