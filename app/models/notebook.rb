class Notebook < ApplicationRecord
    belongs_to :user
    has_many :notes

    validates :heading, presence: true
    validates :description, presence: true
    validates :user_id, presence: true
    validates_numericality_of :user_id

end
