class Task < ApplicationRecord
  BILLABLE_TIME = 42
  BILLABLE_VACATIONS_TIME = 42

  belongs_to :category
  belongs_to :project
  belongs_to :user

    def self.for_user_in_this_week(current_user)
      where(user_id: current_user.id).
      get_current_week_tasks
    end

    def self.get_current_week_tasks
      where("created_at >= ? AND created_at <= ?", Date.current.at_beginning_of_week, Date.current.at_end_of_week)
    end

    validates :description, presence: true
    validates_length_of :description, minimun: 50, maximum: 500 

    def get_billable_hours
        
    end

    def get_unbillable_hours
        
    end
end
