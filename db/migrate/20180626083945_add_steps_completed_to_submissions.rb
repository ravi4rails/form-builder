class AddStepsCompletedToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :steps_completed, :integer, default: 0, null: false
  end
end
