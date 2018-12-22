module EmployeesHelper

    def due_or_completed_time(task)
        if task.status == 'Completed'
            "Task completed at #{task.updated_at.strftime("%A, %b %e")}"
        else
            "Task due at #{due_date_formatted(task)}"
        end
    end

    def display_tasks(task_arr)
        task_arr.each do |task|
            "#{task.project.name} - #{task.content} - #{due_or_completed_time(task)}"
        end
    end 

end
