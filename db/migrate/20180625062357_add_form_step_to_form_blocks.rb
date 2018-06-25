class AddFormStepToFormBlocks < ActiveRecord::Migration[5.1]
  def change
    add_reference :form_blocks, :form_step, foreign_key: true
  end
end
