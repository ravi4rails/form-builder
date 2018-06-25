class FormStep < ApplicationRecord
  belongs_to :multistep_form, optional: true
  has_many :form_blocks, inverse_of: :form_step
  accepts_nested_attributes_for :form_blocks, reject_if: :all_blank, allow_destroy: true
end
