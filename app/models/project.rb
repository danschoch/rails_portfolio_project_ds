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
end
