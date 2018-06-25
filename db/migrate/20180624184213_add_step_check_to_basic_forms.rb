class AddStepCheckToBasicForms < ActiveRecord::Migration[5.1]
  def change
    add_column :basic_forms, :is_multistep_form, :boolean
  end
end
