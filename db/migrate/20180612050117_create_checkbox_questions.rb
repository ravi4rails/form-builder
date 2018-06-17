class CreateCheckboxQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :checkbox_questions do |t|
      t.string :question
      t.references :feedback_form, foreign_key: true

      t.timestamps
    end
  end
end
