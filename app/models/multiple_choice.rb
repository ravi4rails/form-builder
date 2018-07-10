class MultipleChoice < ApplicationRecord
  belongs_to :form_step, optional: true
  has_many :mcq_options, inverse_of: :multiple_choice
  accepts_nested_attributes_for :mcq_options, reject_if: :all_blank, allow_destroy: true

  default_scope { order("priority ASC") }
  
end
