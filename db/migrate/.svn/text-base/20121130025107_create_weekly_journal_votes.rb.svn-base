# -*- encoding : utf-8 -*-
class CreateWeeklyJournalVotes < ActiveRecord::Migration
  def change
    create_table :weekly_journal_votes do |t|
      t.belongs_to :weekly_journal
      t.belongs_to :user
      t.integer :value
      t.timestamps
    end  
    add_index :weekly_journal_votes, :weekly_journal_id
    add_index :weekly_journal_votes, :user_id
  end
end
