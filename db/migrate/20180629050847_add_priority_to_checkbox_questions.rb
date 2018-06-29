class AddPriorityToCheckboxQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :checkbox_questions, :priority, :integer
  end
end
