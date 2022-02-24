class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :key
      t.boolean :is_teacher, :default => false
      t.timestamps
    end
  end
end
