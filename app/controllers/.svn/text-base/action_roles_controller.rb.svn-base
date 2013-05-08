# -*- encoding : utf-8 -*-
class ActionRolesController < ApplicationController
  def index
    @user_actions = UserAction.actions_under_control
    @roles = Role.all
  end

  def toggle
    if pm = ActionRole.find_by_role_id_and_user_action_id(params[:role_id], params[:user_action_id])
      pm.destroy
      flash_info = '成功删除权限！'
    else
      ActionRole.create!(:role_id => params[:role_id], :user_action_id => params[:user_action_id])
      flash_info = '成功创建权限！'
    end
    @flash_content = flash_content(flash_info)
  end
end
