class AddSentToJournyxToTaskTime < ActiveRecord::Migration[5.0]
  def change
    add_column :task_times, :sent_to_journyx, :boolean, default: false
  end
end
