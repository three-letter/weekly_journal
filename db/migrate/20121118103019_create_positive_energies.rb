# -*- encoding : utf-8 -*-
class CreatePositiveEnergies < ActiveRecord::Migration
  create_table :positive_energies do |t|
    t.text :content
    t.integer :user_id
    t.timestamps
  end
end
