# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: user_actions
#
#  id           :integer          not null, primary key
#  action_name  :string(255)
#  name         :string(255)
#  as_default   :boolean
#  as_available :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserAction < ActiveRecord::Base
  attr_accessible :action_name, :name, :as_default, :as_available
  class << self
    def actions_under_control
      UserAction.available_actions - UserAction.default_actions
    end
  
    def refresh!
      actions_from_code.flatten.each do |action|
        a = find_or_create_by_action_name(action)
      end
    end
  end
  
  private
  class << self
    def default_actions
      UserAction.find_all_by_as_default(true)
    end
  
    def available_actions
      UserAction.find_all_by_as_available(true)
    end
  
    def actions_from_code
      results = []
      UserController.all.each do |controller|
        results << controller.constantize.action_methods_with_fullname
      end
      return results - [[]]
    end
  end
end

class UserController
  def self.all
    controllers = Dir.new("#{Rails.root}/app/controllers").entries
    result = []
    controllers.each do |controller|
      if controller =~ /_controller/
        controller = controller.camelize.gsub(".rb", "")
        result << controller
      end
    end
    return result
  end
end