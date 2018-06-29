class Task < ApplicationRecord
  default_scope { order("priority ASC") }
end
