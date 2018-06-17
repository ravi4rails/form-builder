class CreateCheckboxOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :checkbox_options do |t|
      t.string :option
      t.references :checkbox_question, foreign_key: true

      t.timestamps
    end
  end
end
