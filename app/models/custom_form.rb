class CustomForm < ApplicationRecord
  has_many :blocks, inverse_of: :custom_form
  accepts_nested_attributes_for :blocks, reject_if: :all_blank, allow_destroy: true
end
