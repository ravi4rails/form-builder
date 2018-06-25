class CreateFormSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :form_steps do |t|
      t.references :multistep_form, foreign_key: true

      t.timestamps
    end
  end
end
