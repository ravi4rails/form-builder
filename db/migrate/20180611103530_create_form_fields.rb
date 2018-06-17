class CreateFormFields < ActiveRecord::Migration[5.1]
  def change
    create_table :form_fields do |t|
      t.string :label
      t.string :tag
      t.boolean :is_required
      t.references :form, foreign_key: true

      t.timestamps
    end
  end
end
