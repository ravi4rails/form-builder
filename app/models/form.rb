class Form < ApplicationRecord
  has_many :form_fields, inverse_of: :form
  accepts_nested_attributes_for :form_fields, reject_if: :all_blank, allow_destroy: true
end
