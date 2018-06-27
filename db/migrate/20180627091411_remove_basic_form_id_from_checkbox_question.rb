class RemoveBasicFormIdFromCheckboxQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column  :checkbox_questions, :basic_form_id, :bigint
    remove_column  :multiple_choices, :basic_form_id, :bigint
    remove_column  :dropdowns, :basic_form_id, :bigint
    add_column     :checkbox_questions, :form_step_id, :integer
    add_column     :multiple_choices, :form_step_id, :integer
    add_column     :dropdowns, :form_step_id, :integer
  end
end
