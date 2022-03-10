class AddResetPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password, :string
  end
end
