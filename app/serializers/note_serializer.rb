class NoteSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :notebook_id

    has_one :notebook
    has_many :blocks
end