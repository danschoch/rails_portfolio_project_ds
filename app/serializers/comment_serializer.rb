class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :task
  belongs_to :employee
end
