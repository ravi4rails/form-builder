class Submission < ApplicationRecord
  # searchkick
  belongs_to :user, optional: true
  belongs_to :basic_form, optional: true
  has_many :user_response_values, dependent: :destroy
end
