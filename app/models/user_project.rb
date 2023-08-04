class UserProject < ApplicationRecord
    validates :completed_status, presence: true, inclusion: { in: ['to-do', 'in progress', 'completed'], message: "Must be: 'to-do', 'in progress' or 'completed'"}
    validates :user_id, uniqueness: { scope: :project_id, message: "Cannot add the same project twice" }

    belongs_to :user
    belongs_to :project
end
