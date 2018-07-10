class AddCheckboxOptionToIevenOneConditions < ActiveRecord::Migration[5.1]
  def change
    add_reference :level_one_conditions, :checkbox_option, foreign_key: true
    remove_reference :level_one_conditions, :checkbox_question, foreign_key: true
  end
end
