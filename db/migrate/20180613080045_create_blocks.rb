class CreateBlocks < ActiveRecord::Migration[5.1]
  def change
    create_table :blocks do |t|
      t.string :order
      t.references :custom_form, foreign_key: true

      t.timestamps
    end
  end
end
