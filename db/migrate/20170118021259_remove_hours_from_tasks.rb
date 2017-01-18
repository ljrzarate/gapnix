class RemoveHoursFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :hours, :float
  end
end
