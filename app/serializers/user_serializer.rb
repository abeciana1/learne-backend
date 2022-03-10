class UserSerializer < ActiveModel::Serializer
    attributes :id, :f_name, :l_name, :email, :is_teacher

    has_many :notebooks
    has_many :tasks
    has_many :cohorts
    has_many :courses
end