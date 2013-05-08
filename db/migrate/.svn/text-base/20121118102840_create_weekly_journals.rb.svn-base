# -*- encoding : utf-8 -*-
class CreateWeeklyJournals < ActiveRecord::Migration
  def change
    create_table :weekly_journals do |t|
      t.string :title
      t.text :content
      t.integer :visited_times, :default => 0
      t.integer :year
      t.integer :month
      t.integer :week
      t.integer :user_id
      t.timestamps
    end
  end  
end
