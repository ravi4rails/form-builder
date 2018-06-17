class McqOption < ApplicationRecord
  belongs_to :multiple_choice, optional: true
end
