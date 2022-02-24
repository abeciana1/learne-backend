class Cohort < ApplicationRecord
    belongs_to :student, :foreign_key => "student_id", :class_name => "User"
    belongs_to :course
    has_many :lectures

    validates :student_id, presence: true
    validates :course_id, presence: true
    validates_numericality_of :course_id
    validates_numericality_of :student_id

end
