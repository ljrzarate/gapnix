class Task < ApplicationRecord
  # Constants
  BILLABLE_TIME = 42
  BILLABLE_VACATIONS_TIME = 42

  # Relationships
  belongs_to :category
  belongs_to :project
  belongs_to :user
  has_many :task_times

  # Validations
  validates :description, presence: true
  validates_length_of :description, minimun: 50, maximum: 500 
  validates :hours, presence: true

  # Scopes
  #scope :current_user, ->(user) {  where(user_id: user.id) }
  scope :current_weekly, ->(user_id) {  where("created_at >= ? AND created_at <= ? AND user_id = ?", Date.current.at_beginning_of_week, Date.current.at_end_of_week, user_id) }
  scope :weekly_current_task, ->(user) { current_weekly(user.id) }

  # Class methods
  def self.billable_hours(user, billable = true)
    current_weekly(user.id).is_billable?(billable).sum(:hours)
  end

  def self.unibillable_hours(user)
    billable_hours(user, false)
  end

  def self.is_billable? value
    where(billable: value)
  end

  def self.get_current_week_tasks
    where("created_at >= ? AND created_at <= ?", Date.current.at_beginning_of_week, Date.current.at_end_of_week)
  end

  def created_at_day_name
    self.created_at.strftime("%A")
  end

  def created_at_date
    self.created_at.strftime("%d-%m-%Y")
  end
end
