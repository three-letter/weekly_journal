# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: journals
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  receivers  :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Journal < ActiveRecord::Base
  attr_accessible :content, :receivers, :user_id
  belongs_to :user

  after_create :send_notify_email# if ENV["RAILS_ENV"] == "production"

  include ActionView::Helpers::OutputSafetyHelper
  include GeditorHelper
  private
  def send_notify_email
    client = Savon::Client.new do
      wsdl.document = "http://my.grandsoft.com.cn/msgserver/mailserver.dll/wsdl/IMailServer"
    end
    debugger
    response = client.request(:send_mail) do |soap|
      soap.input = ["SendHtmlMail"]
      soap.body = "
      <AMailAddr xsi:type=\"xsd:string\">#{receivers}</AMailAddr>
      <AMailAuthor xsi:type=\"xsd:string\">#{user.email}</AMailAuthor>
      <ASubject xsi:type=\"xsd:string\">#{user.name}#{Date.today}日报</ASubject>
      <AMailBody xsi:type=\"xsd:string\">#{g_format content}</AMailBody>
      "
    end
    result = response.success?
    result

    rescue
    # only in dev do something
  end

  def all_receivers_and_self
    "#{all_receivers}, #{user.email}"
  end

  def all_receivers
    receivers.split(",").map(&:strip).join(", ")
  end
end
