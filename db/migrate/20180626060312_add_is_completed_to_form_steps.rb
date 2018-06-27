class AddIsCompletedToFormSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :form_steps, :is_step_completed, :boolean
  end
end
