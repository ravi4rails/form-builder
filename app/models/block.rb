class Block < ApplicationRecord
  belongs_to :custom_form, optional: true
  has_many :block_fields, as: :taggable
  accepts_nested_attributes_for :block_fields, reject_if: :all_blank, allow_destroy: true
end
