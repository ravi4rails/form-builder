class AddPriorityToFormBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :form_blocks, :priority, :integer
  end
end
