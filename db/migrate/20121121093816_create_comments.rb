# -*- encoding : utf-8 -*-
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :weekly_journal_id

      t.timestamps
    end
  end
end
