class UserFieldValue < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :form_block, optional: true
end
