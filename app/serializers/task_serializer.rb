class TaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :lead_notes, :completed, :project, :employee, :due_date
  has_many :comments
  belongs_to :project
  belongs_to :employee
end
