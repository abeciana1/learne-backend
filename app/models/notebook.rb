class Notebook < ApplicationRecord
    belongs_to :user
    has_many :notes

    validates :heading, presence: true
    validates :description, presence: true

end
