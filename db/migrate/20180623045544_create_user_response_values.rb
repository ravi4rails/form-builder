class CreateUserResponseValues < ActiveRecord::Migration[5.1]
  def change
    create_table :user_response_values do |t|
      t.references :user, foreign_key: true
      t.references :form_block, foreign_key: true
      t.string :form_block_value

      t.timestamps
    end
  end
end
