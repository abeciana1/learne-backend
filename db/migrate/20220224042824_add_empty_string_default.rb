class AddEmptyStringDefault < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :description, :string, :default => ""
    change_column :tasks, :due_date, :string, :default => ""
    change_column :users, :key, :string, :default => ""
  end
end
