class AddPolymorphicFieldsToLevelOneConditions < ActiveRecord::Migration[5.1]
  def change
    add_column :level_one_conditions, :conditionable_type, :string
    add_column :level_one_conditions, :conditionable_id, :integer
  end
end
