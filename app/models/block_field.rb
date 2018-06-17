class BlockField < ApplicationRecord
  belongs_to :block, optional: true
  belongs_to :taggable, polymorphic: true, optional: true
  FIELDTYPE = ["Input", "TextArea", "FileField", "Checkbox", "Radio", "Dropdown"]
end
