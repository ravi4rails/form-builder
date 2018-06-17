class MultipleChoice < ApplicationRecord
  belongs_to :feedback_form, optional: true
  belongs_to :basic_form, optional: true
  has_many :mcq_options, inverse_of: :multiple_choice
  accepts_nested_attributes_for :mcq_options, reject_if: :all_blank, allow_destroy: true
end
