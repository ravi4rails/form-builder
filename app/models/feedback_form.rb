class FeedbackForm < ApplicationRecord
  has_many :short_questions, inverse_of: :feedback_form
  has_many :paragraph_questions, inverse_of: :feedback_form
  has_many :multiple_choices, inverse_of: :feedback_form
  has_many :checkbox_questions, inverse_of: :feedback_form
  has_many :dropdowns, inverse_of: :feedback_form

  accepts_nested_attributes_for :short_questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :paragraph_questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :multiple_choices, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :checkbox_questions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :dropdowns, reject_if: :all_blank, allow_destroy: true
end
