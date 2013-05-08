# == Schema Information
#
# Table name: announcements
#
#  id         :integer          not null, primary key
#  message    :text
#  starts_at  :datetime
#  ends_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at
  
  def self.current_one(hidden_announcement_ids=nil)
    self.current(hidden_announcement_ids).try(:last) 
  end
  
  private
  def self.current(hidden_announcement_ids=nil)
    result = where("starts_at <= :now and ends_at >= :now", now: Time.zone.now)
    result = result.where("id not in (?)", hidden_announcement_ids) if hidden_announcement_ids.present?
    result
  end
end
