class Note < ApplicationRecord
    belongs_to :notebook
    has_many :blocks

    validates :title, presence: true
    validates :description, presence: true

end
