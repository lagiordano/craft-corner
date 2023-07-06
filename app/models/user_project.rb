class UserProject < ApplicationRecord
    validates :completed_status, inclusion: { in: ['wish list', 'in progress', 'completed']}
    validates :user_id, uniqueness: { scope: :project_id }

    belongs_to :user
    belongs_to :project
end
