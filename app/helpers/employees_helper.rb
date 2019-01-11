module EmployeesHelper

    def due_or_completed_time(task)
        if task.status == 'Completed'
            "Task completed at #{task.updated_at.strftime("%A, %b %e")}"
        elsif task.status == 'In Progress' && !task.due_date.nil?
            "Task due at #{due_date_formatted(task)}"
        else
            "No due date specified"
        end
    end

    
end
