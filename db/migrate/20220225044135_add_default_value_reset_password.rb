class AddDefaultValueResetPassword < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :reset_password, :string, :default => ""
  end
end
