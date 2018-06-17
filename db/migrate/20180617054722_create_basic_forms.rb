class CreateBasicForms < ActiveRecord::Migration[5.1]
  def change
    create_table :basic_forms do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
