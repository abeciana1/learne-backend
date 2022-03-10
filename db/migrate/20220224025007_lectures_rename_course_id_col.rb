class LecturesRenameCourseIdCol < ActiveRecord::Migration[6.1]
  def change
    rename_column :lectures, :course_id, :cohort_id
  end
end
