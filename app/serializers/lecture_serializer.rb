class LectureSerializer < ActiveModel::Serializer
    attributes :id, :meeting_time, :meeting_link, :meeting_name, :meeting_description, :cohort_id

    belongs_to :cohort
end