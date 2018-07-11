class CheckboxOption < ApplicationRecord
  belongs_to :checkbox_question, optional: true
  has_many :level_one_conditions, as: :conditionable

  accepts_nested_attributes_for :level_one_conditions, reject_if: :all_blank, allow_destroy: true
end
