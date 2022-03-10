class Lecture < ApplicationRecord
    belongs_to :cohort

    validates :meeting_time, presence: true
    validates :meeting_link, presence: true
    validates :meeting_name, presence: true
    validates :meeting_description, presence: true

end
