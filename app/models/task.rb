class Task < ApplicationRecord
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
end
