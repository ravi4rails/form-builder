class AddPriorityToMultipleChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :multiple_choices, :priority, :integer
  end
end
