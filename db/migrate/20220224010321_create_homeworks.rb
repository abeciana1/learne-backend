class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.string :heading
      t.string :description
      t.string :due_date
      t.boolean :is_complete
      t.integer :student_id
      t.timestamps
    end
  end
end
