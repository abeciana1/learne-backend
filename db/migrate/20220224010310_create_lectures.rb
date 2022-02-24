class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :meeting_time
      t.string :meeting_link
      t.string :meeting_name
      t.string :meeting_description
      t.integer :course_id
      t.timestamps
    end
  end
end
