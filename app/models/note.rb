class Note < ApplicationRecord
    belongs_to :notebook
    has_many :blocks
end
