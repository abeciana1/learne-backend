class RenameHomeworksStudentColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :homeworks, :student_id, :course_id
  end
end
