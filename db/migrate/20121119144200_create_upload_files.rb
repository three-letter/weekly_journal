# -*- encoding : utf-8 -*-
class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.string :image

      t.timestamps
    end
  end
end
