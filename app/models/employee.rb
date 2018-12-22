class Employee < ApplicationRecord
    has_secure_password

    belongs_to :organization
    has_many :tasks
    has_many :projects, through: :tasks
    has_many :comments

    def full_name
        self.first_name + ' ' + self.last_name
    end
    
    def assigned_tasks
        self.tasks.select do |task|
            task.completed == false
        end
    end

    def completed_tasks
        self.tasks.select do |task|
            task.completed == true
        end
    end


end
