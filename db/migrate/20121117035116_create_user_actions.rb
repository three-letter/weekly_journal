# -*- encoding : utf-8 -*-
class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.string :action_name
      t.string :name
      t.boolean :as_default
      t.boolean :as_available

      t.timestamps
    end
  end
end
