class AddPlaceholderToFormBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :form_blocks, :placeholder_text, :string
  end
end
