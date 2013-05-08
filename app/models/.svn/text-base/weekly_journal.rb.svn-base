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

class WeeklyJournal < ActiveRecord::Base
  attr_accessible :content, :title, :visited_times, :user_id, :created_at, :year, :month, :week

  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  has_many :comments, :as => :commentable

  has_many :relative_comments, :class_name => "Comment", :foreign_key => "weekly_journal_id"
  has_many :weekly_journal_votes

  validates_presence_of :content, :title, :message => "不能为空"
  validates_length_of :content, :minimum => 150, :too_short => "不到150字，再写点吧～", :tokenizer => lambda {|value| value.gsub(" ", "").split(//)}

  after_create :save_date

  scope :on_week, lambda { |week| self.where(:week => week.to_i).order(:created_at) }
  scope :this_week, lambda { on_week(Week.this) }

  def self.hotest_five_on_week(week)
    weekly_journals = WeeklyJournal.on_week(week).sort_by {|w| w.score }
    weekly_journals.reverse[0..4]
  end

  def self.weeks_info
    WeeklyJournal.select(:week).uniq.map(&:week).sort
  end

  def score
    votes_count * 10 + comments.count * 2 + visited_times
  end

  def votes_count
    weekly_journal_votes.count
  end

  def author_name
    author.try(:name)
  end

  def relative_authors
    [author]
  end

  def commented_by?(user)
    relative_comments_authors.include? user
  end

  def visited!
    update_attribute(:visited_times, (visited_times.to_i + 1))
  end

  def next
    weekly_journals = WeeklyJournal.on_week(week)
    weekly_journals[weekly_journals.index(self) + 1]
  end

  def previous
    weekly_journals =  WeeklyJournal.on_week(week)
    wj_index = weekly_journals.index(self)
    if (wj_index > 0)
      weekly_journals[wj_index - 1]
    else
      nil
    end
  end

  def author_avatar_url
    author.avatar_url(:thumb)
  end

  private
  def relative_comments_authors
    relative_comments.map(&:author)
  end

  def save_date
    self.week ||= Week.this(self.created_at.to_date)
    self.year = self.created_at.to_date.year
    self.month = self.created_at.to_date.month
    self.save
  end
end