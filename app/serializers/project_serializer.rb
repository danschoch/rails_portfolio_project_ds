class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :due_date, :lead_id, :description, :organization
  
  belongs_to :organization
  has_many :tasks
  has_many :employees, through: :tasks
end
