class User < ApplicationRecord
    has_many :notebooks
    has_many :tasks
    has_many :homeworks, foreign_key: "student_id", class_name: "Homework"
    has_many :cohorts, :primary_key => :user_id, :foreign_key => :student_id
    has_many :courses, through: :cohorts
end