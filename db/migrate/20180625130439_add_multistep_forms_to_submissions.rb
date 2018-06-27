class AddMultistepFormsToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_reference :submissions, :multistep_form, foreign_key: true
  end
end
