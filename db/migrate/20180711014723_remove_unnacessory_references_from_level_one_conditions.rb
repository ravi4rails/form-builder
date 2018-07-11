class RemoveUnnacessoryReferencesFromLevelOneConditions < ActiveRecord::Migration[5.1]
  def change
    remove_reference :level_one_conditions, :form_block, foreign_key: true
    remove_reference :level_one_conditions, :checkbox_option, foreign_key: true
    remove_reference :level_one_conditions, :dropdown_option, foreign_key: true
    remove_reference :level_one_conditions, :mcq_option, foreign_key: true
  end
end
