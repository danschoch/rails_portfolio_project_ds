class Task < ApplicationRecord
    belongs_to :project
    belongs_to :employee, optional: true
    has_many :comments

    validates :content, presence: true

    def status
        if !self.completed && !self.employee
            "Unassigned"
        elsif !self.completed && !!self.employee
            "In Progress"
        else
            "Completed"
        end
    end
    
end
