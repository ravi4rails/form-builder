class AddIsRequiredToMultipleChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :multiple_choices, :is_required, :boolean
  end
end
