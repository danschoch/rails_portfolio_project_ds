class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :title, :lead, :email, :organization
  
  has_many :comments
  has_many :tasks, serializer: EmployeeTaskSerializer
  has_many :projects, through: :tasks
  belongs_to :organization
end
