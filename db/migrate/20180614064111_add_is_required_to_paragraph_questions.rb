class AddIsRequiredToParagraphQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :paragraph_questions, :is_required, :boolean
  end
end
