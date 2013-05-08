# -*- encoding : utf-8 -*-
class UserActionsController < ApplicationController
  respond_to :json, :only => [:update]

  def index
    @user_actions = UserAction.order('as_default, as_available')
  end
  
  def update
    @user_action = UserAction.find(params[:id])
    if @user_action.update_attributes(params[:user_action])
      respond_with @user_action
    end
  end
  
  def refresh
    UserAction.refresh!
    # for once
    WeeklyJournal.fix_month_bug
    flash[:notice] = "加载成功！"
    redirect_to :back
  end
  
  def destroy
    @user_action = UserAction.find(params[:id])
    @user_action.destroy
    flash[:notice] = '成功删除权限！'
    redirect_to :back
  end
end
