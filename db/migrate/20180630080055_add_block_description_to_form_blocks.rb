class AddBlockDescriptionToFormBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :form_blocks, :block_description, :string
  end
end
