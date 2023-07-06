class UserProject < ApplicationRecord
    validates :completed_status, inclusion: { in: ['wish list', 'in progress', 'completed'], message: "must be: 'wish list', 'in progress' or 'completed'"}
    validates :user_id, uniqueness: { scope: :project_id, message: "cannot add the same project twice" }

    belongs_to :user
    belongs_to :project
end
