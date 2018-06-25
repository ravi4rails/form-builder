class AddStepNumberToFormSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :form_steps, :step_number, :string
  end
end
