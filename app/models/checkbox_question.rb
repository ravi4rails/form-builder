class CheckboxQuestion < ApplicationRecord
  belongs_to :form_step, optional: true
  has_many :checkbox_options, inverse_of: :checkbox_question
  accepts_nested_attributes_for :checkbox_options, reject_if: :all_blank, allow_destroy: true

  has_one :level_one_condition
  
end
