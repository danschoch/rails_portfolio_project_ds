class Project < ApplicationRecord
    belongs_to :organization
    has_many :tasks
    has_many :employees, through: :tasks
    has_many :comments, through: :tasks

    def unassigned_project_tasks
        self.tasks.select {|task| task.status == "Unassigned"}
    end

    def assigned_project_tasks
        self.tasks.select {|task| task.status == "In Progress"}
    end

    def completed_project_tasks
        self.tasks.select {|task| task.status == "Completed"}
    end

    def self.active_project_ids(org_id)
        where(organization_id: Employee.find(org_id)).pluck(:id)
    end

    def self.active_projects(org_id)
        self.active_project_ids(org_id).map do |id|
            self.find_by(id: id)
        end
    end
end
