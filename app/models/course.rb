class Course < ApplicationRecord
    belongs_to :teacher, :foreign_key => "teacher_id", :class_name => "User"
    has_many :cohorts
    has_many :students, through: :cohorts
    has_many :homeworks

    validates :name, presence: true
    validates :subject, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates_numericality_of :price
    
end
