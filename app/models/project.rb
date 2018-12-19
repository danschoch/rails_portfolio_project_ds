class Project < ApplicationRecord
    belongs_to :organization
    has_many :tasks
    has_many :employees, through: :tasks
    has_many :comments, through: :tasks

    def unassigned_project_tasks
        self.tasks.where({completed: false, employee_id: nil})
    end

    def assigned_project_tasks
        self.tasks.where({completed: false})
    end

    def completed_project_tasks
        self.tasks.where({completed: true})
    end
end
