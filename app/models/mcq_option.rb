class McqOption < ApplicationRecord
  belongs_to :multiple_choice, optional: true
  has_many :level_one_conditions, as: :conditionable

  accepts_nested_attributes_for :level_one_conditions, reject_if: :all_blank, allow_destroy: true
end
