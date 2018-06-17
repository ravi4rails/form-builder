class CreateBlockFields < ActiveRecord::Migration[5.1]
  def change
    create_table :block_fields do |t|
      t.string :taggable_type
      t.string :taggable_id
      t.string :name
      t.boolean :is_required
      t.string :default_value
      t.string :field_type
      t.string :image
      t.string :video
      t.string :label
      t.string :helptext
      t.references :block, foreign_key: true

      t.timestamps
    end
  end
end
