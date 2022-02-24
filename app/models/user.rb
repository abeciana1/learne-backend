class User < ApplicationRecord
    has_many :notebooks
    has_many :tasks
    has_many :cohorts, :foreign_key => :student_id
    has_many :courses, through: :cohorts
    has_many :courses, :foreign_key => "teacher_id"
end
