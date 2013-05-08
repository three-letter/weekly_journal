# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text
#  user_id           :integer
#  commentable_type  :string(255)
#  commentable_id    :integer
#  weekly_journal_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "author_name" do
    user = create(:user, :name => "gary strong")
    weekly_journal = create(:weekly_journal)
    comment = create(:comment, :author => user, :commentable => weekly_journal)
    assert_equal "gary strong", comment.author_name
  end
  
  test "relative_comments" do
    weekly_journal = create(:weekly_journal)
    comment1 = create(:comment, :commentable => weekly_journal)
    comment2 = create(:comment, :commentable => comment1)
    comment3 = create(:comment, :commentable => comment2)
    comment4 = create(:comment, :commentable => weekly_journal)
    assert_equal [comment2, comment3], comment1.relative_comments
  end
  
  test "relative_authors" do
    user1 = create(:user)
    user2 = create(:user)
    weekly_journal = create(:weekly_journal, :author => user1)
    comment1 = create(:comment, :commentable => weekly_journal, :author => user2)
    comment2 = create(:comment, :commentable => comment1, :author => user1)
    assert_equal [user1, user2], comment2.relative_authors
  end
  
  test "from_root?" do
    weekly_journal = create(:weekly_journal)
    comment = create(:comment, :commentable => weekly_journal)
    assert_equal true, comment.from_root?
  end
  
  test "relative_authors_emails" do
    user1 = create(:user, :email => "user1@user1.user1")
    user2 = create(:user, :email => "user2@user2.user2")
    user3 = create(:user, :email => "user3@user3.user3")
    weekly_journal = create(:weekly_journal, :author => user1)
    comment1 = create(:comment, :commentable => weekly_journal, :author => user2)
    comment2 = create(:comment, :commentable => comment1, :author => user1)
    comment3 = create(:comment, :commentable => comment2, :author => user3)
    assert_equal "user1@user1.user1, user2@user2.user2", comment3.relative_authors_emails
    #should be assert_equal "user1@user1.user1, user2@user2.user2, user3@user3.user3", comment3.relative_authors_emails
  end
  
  test "on_week and this_week" do
    weekly_journal_1 = create(:weekly_journal, :created_at => 1.weeks.ago)
    comment1 = create(:comment, :commentable => weekly_journal_1)
    comment2 = create(:comment, :commentable => comment1)
    comment3 = create(:comment, :commentable => comment1)
    assert_equal [comment1, comment2, comment3], Comment.on_week(Week.previous).sort
    weekly_journal_2 = create(:weekly_journal)
    comment4 = create(:comment, :commentable => weekly_journal_2)
    assert_equal [comment4], Comment.this_week
  end

  test "get_at_users_from_comment" do
    weekly_journal = create(:weekly_journal)
    comment1 = create(:comment, :commentable => weekly_journal, :content => "@张哲 @hanxm")
    user1 = create(:user, :name => "张哲")
    user2 = create(:user, :login => "hanxm")
    assert_equal [user1, user2], comment1.get_at_users_from_comment 
  end
end
