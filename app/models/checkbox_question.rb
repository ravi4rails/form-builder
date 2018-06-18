class CheckboxQuestion < ApplicationRecord
  belongs_to :feedback_form, optional: true
  belongs_to :basic_form, optional: true
  has_many :checkbox_options, inverse_of: :checkbox_question
  accepts_nested_attributes_for :checkbox_options, reject_if: :all_blank, allow_destroy: true
end
