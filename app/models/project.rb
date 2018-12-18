class Project < ApplicationRecord
    belongs_to :organization
    has_many :tasks
    has_many :employees, through: :tasks
    has_many :comments, through: :tasks
end
