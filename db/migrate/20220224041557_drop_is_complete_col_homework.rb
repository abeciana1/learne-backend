class DropIsCompleteColHomework < ActiveRecord::Migration[6.1]
  def change
    remove_column :homeworks, :is_complete
  end
end
