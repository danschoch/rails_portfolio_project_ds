class Task < ApplicationRecord
    belongs_to :project
    belongs_to :employee, optional: true
    has_many :comments
end
