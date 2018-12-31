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

    def task_formatted(task) #TODO flesh this out to link to project and content (maybe separate into indivdual methods and combine in controller or view?)
        "#{task.project.name} - #{task.content} - #{due_or_completed_time(task)}"
    end

end
