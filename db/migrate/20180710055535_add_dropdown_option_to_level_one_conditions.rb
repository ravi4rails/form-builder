class AddDropdownOptionToLevelOneConditions < ActiveRecord::Migration[5.1]
  def change
    add_reference :level_one_conditions, :dropdown_option, foreign_key: true
    remove_reference :level_one_conditions, :dropdown, foreign_key: true
  end
end
