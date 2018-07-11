class DropdownOption < ApplicationRecord
  belongs_to :dropdown, optional: true
  has_many :level_one_conditions, as: :conditionable

  accepts_nested_attributes_for :level_one_conditions, reject_if: :all_blank, allow_destroy: true
end
