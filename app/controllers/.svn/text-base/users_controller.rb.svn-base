# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
  
  def show
    @user = User.find(params[:id])
    if current_user != @user
      flash[:error] = "您没有权限！"
      redirect_to :back
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: '更新成功！'
    else
      render "show"
    end
  end
end
