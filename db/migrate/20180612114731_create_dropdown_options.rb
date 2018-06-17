class CreateDropdownOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :dropdown_options do |t|
      t.string :option
      t.references :dropdown, foreign_key: true

      t.timestamps
    end
  end
end
