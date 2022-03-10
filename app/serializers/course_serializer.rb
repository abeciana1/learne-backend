class CourseSerializer < ActiveModel::Serializer
    attributes :id, :name, :subject, :description, :price, :teacher_id
    
    has_one :teacher
    has_many :cohorts
    has_many :students
end