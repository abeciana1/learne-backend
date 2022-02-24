class Block < ApplicationRecord
    belongs_to :note

    validates :block_data_id, uniqueness: true
    validates :block_type, presence: true
    validates :block_content, presence: true
    validates :note_id, presence: true
end
