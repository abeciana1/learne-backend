class NotebookSerializer < ActiveModel::Serializer
    attributes :id, :heading, :description, :user_id

    has_one :user
    has_many :notes
end