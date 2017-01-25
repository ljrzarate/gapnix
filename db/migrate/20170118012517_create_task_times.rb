class CreateTaskTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :task_times do |t|
      t.boolean :is_active, null: false, default: false
      t.datetime :start_date, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end

    add_reference :task_times, :task, index: true, foreign_key: true
    add_column :task_times, :hours, :float, default: 0.0, null: false
  end
end
