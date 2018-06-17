class CreateFormBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :form_blocks do |t|
      t.string :label
      t.string :field_type
      t.boolean :is_required
      t.references :basic_form, foreign_key: true

      t.timestamps
    end
  end
end
