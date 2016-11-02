class Task < ApplicationRecord
    belongs_to :category
    belongs_to :project
    belongs_to :user

    # def for_user_in_this_week(current_user)
    #   today = Date.
    #   Task.where()
    # end
end
