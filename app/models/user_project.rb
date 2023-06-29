class UserProject < ApplicationRecord
    validates :completed_status, inclusion: { in: ['wish list', 'in progress', 'completed']}

    belongs_to :user
    belongs_to :project
end
