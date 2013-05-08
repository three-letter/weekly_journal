# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: weekly_journal_votes
#
#  id                :integer          not null, primary key
#  weekly_journal_id :integer
#  user_id           :integer
#  value             :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  week              :string(255)
#

class WeeklyJournalVote < ActiveRecord::Base
  attr_accessible :value, :weekly_journal_id, :user_id, :week

  belongs_to :user
  belongs_to :weekly_journal
  after_create :set_week
  
  private
  def set_week
    self.update_attributes(:week => weekly_journal.week)
  end
end