class CreateMultipleChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :multiple_choices do |t|
      t.string :question
      t.references :feedback_form, foreign_key: true

      t.timestamps
    end
  end
end
