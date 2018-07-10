class Dropdown < ApplicationRecord
  belongs_to :form_step, optional: true
  has_many :dropdown_options, inverse_of: :dropdown
  accepts_nested_attributes_for :dropdown_options, reject_if: :all_blank, allow_destroy: true
  default_scope { order("priority ASC") }
end
