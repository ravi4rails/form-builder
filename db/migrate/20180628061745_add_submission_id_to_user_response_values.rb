class AddSubmissionIdToUserResponseValues < ActiveRecord::Migration[5.1]
  def change
    add_column :user_response_values, :submission_id, :integer
  end
end
