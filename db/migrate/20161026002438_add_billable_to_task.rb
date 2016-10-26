class AddBillableToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :billable, :boolean, default: false, null: false
    add_column :tasks, :hours, :float, default: 0.0, null: false
  end
end
