class CreateUserFieldValues < ActiveRecord::Migration[5.1]
  def change
    create_table :user_field_values do |t|
      t.string :value
      t.references :user, foreign_key: true
      t.references :form_block, foreign_key: true

      t.timestamps
    end
  end
end
