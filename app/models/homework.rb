class Homework < ApplicationRecord
    belongs_to :course

    validates :heading, presence: true
    validates :description, presence: true
    validates :due_date, presence: true

end
