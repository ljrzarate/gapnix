class Task < ApplicationRecord
  # Constants
  BILLABLE_TIME = 42
  BILLABLE_VACATIONS_TIME = 42

  # Relationships
  belongs_to :category
  belongs_to :project
  belongs_to :user

  # Validations
  validates :description, presence: true
  validates_length_of :description, minimun: 50, maximum: 500 

  # Scopes
  scope :current_user, ->(user) {  where(user_id: user.id) }
  scope :current_weekly, -> {  where("created_at >= ? AND created_at <= ?", Date.current.at_beginning_of_week, Date.current.at_end_of_week) }
  scope :weekly_current_task, ->(user) { current_user(user).current_weekly }

  # Class methods
  def self.billable_hours(user, billable)
    current_user(user).current_weekly.is_billable?(billable).sum(:hours)
  end

  def self.is_billable? value
    where(billable: value)
  end
end
