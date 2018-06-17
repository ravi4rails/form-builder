class CreateDropdowns < ActiveRecord::Migration[5.1]
  def change
    create_table :dropdowns do |t|
      t.string :title
      t.references :feedback_form, foreign_key: true

      t.timestamps
    end
  end
end
