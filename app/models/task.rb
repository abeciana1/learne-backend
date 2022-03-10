class Task < ApplicationRecord
    belongs_to :user

    validates :heading, presence: true
    validates :is_complete, presence: true
end
