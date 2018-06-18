class Dropdown < ApplicationRecord
  belongs_to :feedback_form, optional: true
  belongs_to :basic_form, optional: true
  has_many :dropdown_options, inverse_of: :dropdown
  accepts_nested_attributes_for :dropdown_options, reject_if: :all_blank, allow_destroy: true
end
