module TasksHelper

    def task_formatted(task) #TODO flesh this out to link to project and content (maybe separate into indivdual methods and combine in controller or view?)
        "#{task.project.name} - #{task.content} - #{due_or_completed_time(task)}"
    end

end
