# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter CASClient::Frameworks::Rails::Filter
  # g_authorization_with :current_user_name

  def current_user
		@current_user ||= User.fetch_by_login(session[:cas_user])
    # @current_user ||= User.fetch_by_login("xumc")
  end

  def current_user_name
    current_user.name
  end
  helper_method :current_user, :current_user_name

  def self.action_methods_with_fullname
    (action_methods.to_a - ApplicationController.new.action_methods.to_a).map{|name| self.to_s.gsub!("Controller", "") + "#" + name}
  end

  private
  def flash_content(notice)
    "<div class='alert alert-success'><a class='close' data-dismiss='alert'>x</a>#{notice}</div>"
  end
end
