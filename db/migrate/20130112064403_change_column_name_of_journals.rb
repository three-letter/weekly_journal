class ChangeColumnNameOfJournals < ActiveRecord::Migration
  def up
    rename_column(:journals, :title, :receivers)
  end

  def down
    rename_column(:journals, :receivers, :title)
  end
end
