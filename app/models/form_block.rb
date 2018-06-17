class FormBlock < ApplicationRecord
  belongs_to :basic_form, optional: true
  FIELDTYPE = ["input", "textarea", "file", "email"]
end
