class FormBlock < ApplicationRecord
  # searchkick
  belongs_to :basic_form, optional: true
  belongs_to :form_step, optional: true
  has_many :user_response_values
  FIELDTYPE = ["input", "textarea", "file", "email", "password", "number", "date"]

  default_scope { order("priority ASC") }

  has_many :level_one_conditions, as: :conditionable

  accepts_nested_attributes_for :level_one_conditions, reject_if: :all_blank, allow_destroy: true
  
end

# fbs = FormBlock.search("last name")
# fbs.each do |fb|
#   fb.user_response_values.each do |urv|
#     puts urv.form_block_value
#   end
# end