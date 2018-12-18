class Task < ApplicationRecord
    belongs_to :project
    belongs_to :employee
    has_many :comments
end
