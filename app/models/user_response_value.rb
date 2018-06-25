class UserResponseValue < ApplicationRecord
  belongs_to :user
  belongs_to :form_block
end
