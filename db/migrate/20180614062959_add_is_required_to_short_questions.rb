class AddIsRequiredToShortQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :short_questions, :is_required, :boolean
  end
end
