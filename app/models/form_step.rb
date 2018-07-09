class FormStep < ApplicationRecord
  belongs_to :multistep_form, optional: true
  belongs_to :basic_form, optional: true
  has_many :form_blocks, inverse_of: :form_step


  accepts_nested_attributes_for :form_blocks, reject_if: :all_blank, allow_destroy: true

  has_many :multiple_choices, inverse_of: :form_step 
  has_many :checkbox_questions, inverse_of: :form_step
  has_many :dropdowns, inverse_of: :form_step
  accepts_nested_attributes_for :multiple_choices, reject_if: :all_blank, allow_destroy: true
  
  accepts_nested_attributes_for :checkbox_questions, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :dropdowns, reject_if: :all_blank, allow_destroy: true
  
end
