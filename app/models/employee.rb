class Employee < ApplicationRecord
    has_secure_password

    belongs_to :organization
    has_many :tasks
    has_many :projects, through: :tasks
    has_many :comments
end
