class TaskSerializer < ActiveModel::Serializer
    attributes :id, :heading, :description, :due_date, :is_complete, :user_id

    belongs_to :user
end