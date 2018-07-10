class AddMcqOptionToLevelOneConditions < ActiveRecord::Migration[5.1]
  def change
    add_reference :level_one_conditions, :mcq_option, foreign_key: true
    remove_reference :level_one_conditions, :multiple_choice, foreign_key: true
  end
end
