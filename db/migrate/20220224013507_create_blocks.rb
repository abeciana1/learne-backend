class CreateBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :blocks do |t|
      t.string :block_data_id
      t.text :block_content
      t.string :block_type
      t.text :note_id
      t.timestamps
    end
  end
end
