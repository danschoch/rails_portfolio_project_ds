class Employee < ApplicationRecord
    has_secure_password

    belongs_to :organization
    has_many :tasks
    has_many :projects, through: :tasks
    has_many :comments

    def full_name
        self.first_name + ' ' + self.last_name
    end


end
