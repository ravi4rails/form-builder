class CreateShortQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :short_questions do |t|
      t.string :question
      t.string :answer
      t.references :feedback_form, foreign_key: true

      t.timestamps
    end
  end
end
