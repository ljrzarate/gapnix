class TaskTime < ApplicationRecord
  # Relationships
  belongs_to :task

  # Validations
  validates :start_date, presence: true
end
