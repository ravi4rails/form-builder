class CheckboxOption < ApplicationRecord
  belongs_to :checkbox_question, optional: true
end
