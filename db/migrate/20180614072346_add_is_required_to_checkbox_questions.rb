class AddIsRequiredToCheckboxQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :checkbox_questions, :is_required, :boolean
  end
end
