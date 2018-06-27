class RemoveBasicFormIdFromFormBlocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :form_blocks, :basic_form_id, :integer
  end
end
