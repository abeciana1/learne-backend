class NoteSerializer < ActiveModel::Serializer
    attributes :id, :title, :description, :notebook_id

    belongs_to :notebook
    has_many :blocks
end