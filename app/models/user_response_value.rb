class UserResponseValue < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :form_block, optional: true
  belongs_to :submission, optional: true
end
