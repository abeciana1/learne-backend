class Course < ApplicationRecord
    belongs_to :teacher, :foreign_key => "teacher_id", :class_name => "User"
    has_many :cohorts
    has_many :students, through: :cohorts
    has_many :homeworks
end
