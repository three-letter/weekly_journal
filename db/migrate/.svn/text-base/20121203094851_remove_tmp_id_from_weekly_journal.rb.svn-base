# -*- encoding : utf-8 -*-
class RemoveTmpIdFromWeeklyJournal < ActiveRecord::Migration
  def up
    remove_column :weekly_journals, :tmp_id
  end

  def down
    add_column :weekly_journals, :tmp_id, :integer
  end
end
