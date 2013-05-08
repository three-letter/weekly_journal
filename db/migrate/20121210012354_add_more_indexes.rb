class AddMoreIndexes < ActiveRecord::Migration
  def change
    add_index :weekly_journals, :user_id
    add_index :weekly_journals, :week
    add_index :positive_energies, :user_id
    add_index :comments, :user_id
    add_index :comments, :weekly_journal_id    
    add_index :action_roles, :user_action_id    
    add_index :action_roles, :role_id    
    add_index :comments, [:commentable_id, :commentable_type]
  end
end
