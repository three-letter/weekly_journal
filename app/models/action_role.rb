# == Schema Information
#
# Table name: action_roles
#
#  id             :integer          not null, primary key
#  user_action_id :integer
#  role_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: action_roles
#
#  id             :integer          not null, primary key
#  user_action_id :integer
#  role_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class ActionRole < ActiveRecord::Base
  belongs_to :user_action
  belongs_to :role
  attr_accessible :user_action_id, :role_id, :has_right

  def self.fetch_by_role_id_and_user_action_id(role_id, user_action_id)
    ActionRole.find_by_role_id_and_user_action_id(role_id, user_action_id) || ActionRole.new
  end
end
