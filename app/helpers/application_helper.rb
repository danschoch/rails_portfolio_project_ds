module ApplicationHelper

    # To be used for task and project due dates
    def due_date_formatted(obj)
        obj.due_date.strftime("%A, %b %e") if obj.due_date
    end

end
