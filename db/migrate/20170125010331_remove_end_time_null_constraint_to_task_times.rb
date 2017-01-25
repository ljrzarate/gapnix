class RemoveEndTimeNullConstraintToTaskTimes < ActiveRecord::Migration[5.0]
  def change
    change_column_null :task_times, :end_time, true
  end
end
