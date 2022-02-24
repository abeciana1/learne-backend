class Task < ApplicationRecord
    belongs_to :user

    validates :heading, presence: true
    validates :is_complete, presence: true
    validates :user_id, presence: true
    validates_numericality_of :user_id

end
