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

class Comment < ActiveRecord::Base
  attr_accessible :weekly_journal_id, :parent_id, :content, :user_id, :created_at

  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  has_many :comments, :as => :commentable
  belongs_to :commentable, :polymorphic => true
  belongs_to :weekly_journal

  after_create :send_notify_mail if ENV["RAILS_ENV"] == "production"
  validates_presence_of :content, :message => "不能为空"

  after_create :save_weekly_journal_id

  scope :this_week, lambda { on_week(Week.this) }
  scope :on_week, lambda { |week| WeeklyJournal.on_week(week).map(&:relative_comments).flatten }


  def Comment.reload_weekly_journal_relation
    Comment.all.each do |comment|
      comment.send :save_weekly_journal_id
    end
  end

  def author_name
    author.try(:name)
  end

  # save after save!
  def weekly_journal
    commentable = self
    while commentable.respond_to?("commentable")
      commentable = commentable.commentable
    end
    commentable
  end

  def week
    Week.get_week(created_at)
  end

  # just for email and commnets on week
  def relative_comments
    result = []
    comments.each do |comment|
      result << comment
      result << comment.relative_comments if comment.relative_comments.present?
    end
    result.flatten
  end
  # get @user list from comment, like weibo
  def get_at_users_from_comment
    result = []
    content.split(" ").each do |word|
      if word.start_with?("@")
        name = word[1..-1]
        if user = User.find_by_name(name) || User.find_by_login(name)
          result << user
        end
      end
    end
    result
  end

  def relative_authors
    result = commentable ? ([author] + commentable.relative_authors).flatten : [author]
    result.uniq
  end

  def relative_authors_emails
    [relative_authors + get_at_users_from_comment - [author]].flatten.map(&:email).join(", ")
    #[relative_authors + get_at_users_from_comment].flatten.map(&:email).join(", ")
  end

  def from_root?
    commentable.is_a?(WeeklyJournal)
  end

  def author_avatar_url
    author.avatar_url(:thumb)
  end

  def build_mail_comment
    result = "
      <tr>
        <td>#{author_name}</td>
        <td>#{content}</td>
      </tr> "

    if has_parent_comment?
      result = result + commentable.build_mail_comment
    end
    result
  end

  private
  def save_weekly_journal_id
    self.update_attributes(:weekly_journal_id => weekly_journal.id)
  end

  def send_notify_mail
    return if relative_authors_emails.empty?
    client = Savon::Client.new do
      wsdl.document = "http://my.grandsoft.com.cn/msgserver/mailserver.dll/wsdl/IMailServer"
    end
    response = client.request(:send_mail) do |soap|
      soap.input = ["SendHtmlMail"]
      soap.body = "
      <AMailAddr xsi:type=\"xsd:string\">#{relative_authors_emails}</AMailAddr>
      <AMailAuthor xsi:type=\"xsd:string\">#{author.email}</AMailAuthor>
      <ASubject xsi:type=\"xsd:string\">[think]#{author.name}在[#{weekly_journal.title}]中回复了您</ASubject>
      <AMailBody xsi:type=\"xsd:string\">#{content_with_link_back}</AMailBody>
      "

    end
    result = response.success?
    result
  #rescue
    # only in dev do something
  end

  def has_parent_comment?
     commentable && commentable.is_a?(Comment)
  end


  def content_with_link_back
    # FIXME later
    result = build_mail_comment
    result =
      "<html>
        <style type='text/css'>
          table {
              font-family: 宋体;
              font-size:13px;
              color:#333333;
              border-width: 1px;
              border-color: #666666;
              border-collapse: collapse;
          }
          table th {
              border-width: 1px;
              padding: 8px;
              border-style: solid;
              border-color: #666666;
              background-color: #dedede;
          }
          table td {
              border-width: 1px;
              padding: 8px;
              border-style: solid;
              border-color: #666666;
              background-color: #ffffff;
          }
        </style>
      <body>
      <table border='1'>
          <tr>
            <th width='80'>作者</th>
            <th>评论</th>
          </tr>
          <tr>
            <td>#{weekly_journal.author_name}</td>
            <td>#{weekly_journal.content}</td>
          </tr> " \
      + result \
      + "</table>
        <br />
        <a href=\"http://think.grandsoft.com.cn/#{Rails.application.routes.url_helpers.weekly_journal_path(self.weekly_journal.id)}\">查看文章</a>" \
      + "</body></html>"
    ActionController::Base.helpers.send(:h, result)
  end
end
