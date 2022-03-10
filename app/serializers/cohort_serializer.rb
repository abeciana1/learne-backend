class CohortSerializer < ActiveModel::Serializer
    attributes :id, :student_id, :course_id
    
    has_one :student
    has_one :course
    has_many :lectures
end