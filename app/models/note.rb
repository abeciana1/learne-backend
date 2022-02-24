class Note < ApplicationRecord
    belongs_to :notebook
    has_many :blocks

    validates :title, presence: true
    validates :description, presence: true
    validates :notebook_id, presence: true
    validates_numericality_of :notebook_id

end
