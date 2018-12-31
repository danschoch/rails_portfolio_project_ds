class Comment < ApplicationRecord
    belongs_to :task
    belongs_to :employee

    validates :content, presence: true
end
