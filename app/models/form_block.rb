class FormBlock < ApplicationRecord
  # searchkick
  belongs_to :basic_form, optional: true
  belongs_to :form_step, optional: true
  has_many :user_response_values
  FIELDTYPE = ["input", "textarea", "file", "email", "password", "number"]
end

# fbs = FormBlock.search("last name")
# fbs.each do |fb|
#   fb.user_response_values.each do |urv|
#     puts urv.form_block_value
#   end
# end