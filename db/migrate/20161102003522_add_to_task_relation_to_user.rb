class AddToTaskRelationToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :user, index: true, foreign_key: true
  end
end
