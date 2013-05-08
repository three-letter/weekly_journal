# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: weekly_journals
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  content       :text
#  visited_times :integer          default(0)
#  year          :integer
#  month         :integer
#  week          :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class WeeklyJournalTest < ActiveSupport::TestCase
  test "on_week and this_week" do
    weekly_journal_1 = create(:weekly_journal)
    weekly_journal_2 = create(:weekly_journal)
    weekly_journal_3 = create(:weekly_journal, :created_at => 1.weeks.ago)
    assert_equal [weekly_journal_1, weekly_journal_2], WeeklyJournal.this_week
    assert_equal [weekly_journal_3], WeeklyJournal.on_week(Week.previous)
  end

  test "relative_comments" do
    weekly_journal = create(:weekly_journal)
    comment1 = create(:comment, :commentable => weekly_journal)
    comment2 = create(:comment, :commentable => comment1)
    comment3 = create(:comment, :commentable => comment2)
    assert_equal [comment1, comment2, comment3], weekly_journal.relative_comments.sort
  end

  test "score" do
    weekly_journal_17 = create(:weekly_journal, :visited_times => 5)
    create(:weekly_journal_vote, :weekly_journal => weekly_journal_17)
    create(:weekly_journal_vote, :weekly_journal => weekly_journal_17)
    comment = create(:comment, :commentable => weekly_journal_17)
    assert_equal 27, weekly_journal_17.score

    weekly_journal_11 = create(:weekly_journal, :visited_times => 11)
    assert_equal 11, weekly_journal_11.score

    weekly_journal_3 = create(:weekly_journal, :visited_times => 1)
    comment = create(:comment, :commentable => weekly_journal_3)
    assert_equal 3, weekly_journal_3.score
  end

  test "commented_by?" do
    user1 = build(:user)
    user2 = build(:user)
    weekly_journal = create(:weekly_journal)
    weekly_journal.stubs(:relative_comments_authors).returns([user1])
    assert_equal true, weekly_journal.commented_by?(user1)
    assert_equal false, weekly_journal.commented_by?(user2)
  end

  test "visited!" do
    weekly_journal = create(:weekly_journal)
    assert_difference "weekly_journal.visited_times", +1 do
      weekly_journal.visited!
    end
  end

  test "previous" do
    weekly_journal_1 = create(:weekly_journal)
    weekly_journal_2 = create(:weekly_journal)
    weekly_journal_3 = create(:weekly_journal)
    weekly_journal_4 = create(:weekly_journal, :created_at => 1.weeks.ago)
    assert_equal weekly_journal_2, weekly_journal_1.next
    assert_equal weekly_journal_2, weekly_journal_3.previous
    assert_nil weekly_journal_3.next
  end
end
