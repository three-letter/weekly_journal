# -*- encoding : utf-8 -*-
module UserActionsHelper
  def get_user_action_class(user_action)
    case
    when user_action.as_available? && user_action.as_default?
      "info"
    when user_action.as_available?
      "success"
    else
      ""
    end
  end
end