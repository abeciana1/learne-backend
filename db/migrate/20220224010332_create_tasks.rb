class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :heading
      t.string :description
      t.string :due_date
      t.boolean :is_complete
      t.integer :user_id
      t.timestamps
    end
  end
end
