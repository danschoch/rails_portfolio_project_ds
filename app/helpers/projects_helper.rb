module ProjectsHelper
    def project_lead_name(project)
        lead = Employee.find_by(id: project.lead_id) if project.lead_id
        "#{lead.full_name}"
    end

    def deadline_formatted(project) #TODO: delete this and replace with app_helper method
        project.due_date.strftime("%A, %b %e")
    end
end
