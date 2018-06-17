class Submission < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :basic_form, optional: true
end
