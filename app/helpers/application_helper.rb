module ApplicationHelper

    # To be used for task and project due dates (TODO: use this method to replace the one in projects_helper.rb)
    def due_date_formatted(obj)
       date_formatted(obj.due_date) if obj.due_date
    end

    def date_formatted(date)
        if Date.today.year != date.year
            date.strftime("%A, %b %e, %Y")
        else
            date.strftime("%A, %b %e")
        end
    end

    def curr_employee
        Employee.find(session[:employee_id])
    end

    def curr_employee_name
        curr_employee.first_name
    end
    
end
