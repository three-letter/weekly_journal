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

require 'test_helper'

class UserActionTest < ActiveSupport::TestCase
  test "actions_under_control" do
    user_action1 = create(:user_action)
    user_action2 = create(:user_action)
    user_action3 = create(:default_action)
    assert_equal [user_action1, user_action2], UserAction.actions_under_control
  end
end
