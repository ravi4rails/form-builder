class LevelOneCondition < ApplicationRecord
  # belongs_to :form_block, optional: true
  # belongs_to :dropdown_option, optional: true
  # belongs_to :checkbox_option, optional: true
  # belongs_to :mcq_option, optional: true

  belongs_to :conditionable, polymorphic: true, optional: true

end
