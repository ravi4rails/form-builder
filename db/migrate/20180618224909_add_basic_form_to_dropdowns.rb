class AddBasicFormToDropdowns < ActiveRecord::Migration[5.1]
  def change
    add_reference :dropdowns, :basic_form, foreign_key: true
  end
end
