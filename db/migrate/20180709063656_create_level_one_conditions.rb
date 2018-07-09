class CreateLevelOneConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :level_one_conditions do |t|
      t.references :form_block, foreign_key: true
      t.references :dropdown, foreign_key: true
      t.references :checkbox_question, foreign_key: true
      t.references :multiple_choice, foreign_key: true
      t.string :conditional_question
      t.string :conditional_answer

      t.timestamps
    end
  end
end
