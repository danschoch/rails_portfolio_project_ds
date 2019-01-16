class EmployeeTaskSerializer < ActiveModel::Serializer
  attributes :id, :content, :completed, :project, :due_date
  
end
