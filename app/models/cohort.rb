class Cohort < ApplicationRecord
    belongs_to :student, :foreign_key => "student_id", :class_name => "User"
    belongs_to :course
    has_many :lectures
end
