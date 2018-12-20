class Comment < ApplicationRecord
    belongs_to :task, optional: true
    belongs_to :employee, optional: true#TODO: delete optional arguments when current_user is available to form
end
