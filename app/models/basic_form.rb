class BasicForm < ApplicationRecord
  has_many :form_blocks, inverse_of: :basic_form
  has_many :multiple_choices, inverse_of: :basic_form 
  has_many :submissions, dependent: :destroy
  accepts_nested_attributes_for :form_blocks, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :multiple_choices, reject_if: :all_blank, allow_destroy: true
end
