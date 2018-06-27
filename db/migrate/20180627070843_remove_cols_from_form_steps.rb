class RemoveColsFromFormSteps < ActiveRecord::Migration[5.1]
  def change
    remove_column :form_steps, :is_step_completed, :boolean
    remove_column :form_steps, :multistep_form_id, :bigint
  end
end
