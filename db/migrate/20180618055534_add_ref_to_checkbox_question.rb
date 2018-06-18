class AddRefToCheckboxQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :checkbox_questions, :basic_form, foreign_key: true
  end
end
