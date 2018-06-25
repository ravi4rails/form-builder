class AddStepNameToFormSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :form_steps, :name, :string
  end
end
