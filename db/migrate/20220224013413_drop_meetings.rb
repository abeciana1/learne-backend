class DropMeetings < ActiveRecord::Migration[6.1]
  def change
    drop_table :meetings
  end
end
