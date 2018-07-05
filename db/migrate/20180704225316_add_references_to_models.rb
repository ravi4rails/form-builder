class AddReferencesToModels < ActiveRecord::Migration[5.1]
  def change
    add_reference :multiple_choices, :basic_form, foreign_key: true
    add_reference :checkbox_questions, :basic_form, foreign_key: true
    add_reference :dropdowns, :basic_form, foreign_key: true
  end
end
