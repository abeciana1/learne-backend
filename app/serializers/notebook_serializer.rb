class NotebookSerializer < ActiveModel::Serializer
    attributes :id, :heading, :description, :user_id

    belongs_to :user
    has_many :notes
end