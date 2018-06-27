class AddBasicFormIdToFormSteps < ActiveRecord::Migration[5.1]
  def change
    add_reference :form_steps, :basic_form, foreign_key: true
  end
end
