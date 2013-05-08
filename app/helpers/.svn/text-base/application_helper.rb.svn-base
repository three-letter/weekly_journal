# -*- encoding : utf-8 -*-
module ApplicationHelper

  def avatar(user)
    if user.avatar_url(:thumb) && File.exists?("public/#{user.avatar_url(:thumb)}")
      image_tag user.avatar_url(:thumb), :class => "media-object img-rounded"
    else
      image_tag string_image_url(user.name), :class => "media-object img-rounded"
    end
  end

  def edit_icon
    raw("<i class='icon-edit'></i>")
  end

  def delete_icon
    raw("<i class='icon-remove'></i>")
  end

  def current_announcement
    Announcement.current_one(cookies.signed[:hidden_announcement_ids])
  end

  def this_week
    Week.this
  end

  def next_week
    Week.next
  end

  def previous_week
    Week.previous
  end

  # quick t to Chinese
  def will_paginate_c(items)
    will_paginate items, :previous_label => "上一页", :next_label => "下一页"
  end

  def browser_is?(query)
    query = query.to_s.strip.downcase
    result = case query
    when /^ie(\d+)$/
      user_agent_info.index("msie #{$1}") && !user_agent_info.index('opera') && !user_agent_info.index('webtv')
    when 'ie'
      user_agent_info.match(/msie \d/) && !user_agent_info.index('opera') && !user_agent_info.index('webtv')
    when 'yahoobot'
      user_agent_info.index('yahoo! slurp')
    when 'mozilla'
      user_agent_info.index('gecko') || user_agent_info.index('mozilla')
    when 'webkit'
      user_agent_info.match(/webkit|iphone|ipad|ipod/)
    when 'safari'
      user_agent_info.index('safari') && !user_agent_info.index('chrome')
    when 'ios'
      user_agent_info.match(/iphone|ipad|ipod/)
    when /^robot(s?)$/
      user_agent_info.match(/googlebot|msnbot/) || browser_is?('yahoobot')
    when 'mobile'
      browser_is?('ios') || user_agent_info.match(/android|webos|mobile/)
    else
      user_agent_info.index(query)
    end
    not (result.nil? || result == false)
  end

  private
  def user_agent_info
    @user_agent_info ||= begin
      request.env['HTTP_USER_AGENT'].downcase
    rescue
      ''
    end
  end
end
