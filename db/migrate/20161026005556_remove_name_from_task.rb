class RemoveNameFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :name, :string
  end
end
