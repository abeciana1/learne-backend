class Homework < ApplicationRecord
    belongs_to :course

    validates :heading, presence: true
    validates :description, presence: true
    validates :due_date, presence: true
    validates :course_id, presence: true
    validates_numericality_of :course_id

end
