class ShortQuestion < ApplicationRecord
  belongs_to :feedback_form, optional: true
end
