class LevelOneCondition < ApplicationRecord
  belongs_to :form_block, optional: true
  belongs_to :dropdown_option, optional: true
  belongs_to :checkbox_question, optional: true
  belongs_to :multiple_choice, optional: true
end
