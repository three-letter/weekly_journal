# -*- encoding : utf-8 -*-
class JournalsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @journals = @user.journals.order("created_at DESC").paginate(:page => params[:page] || 1, :per_page => 5)
    render :layout => "application"
  end
  
  def new
    @journal = Journal.new(:receivers => current_user.default_receivers)
  end
  
  def create
    @journal = current_user.journals.new(params[:journal])
    if @journal.save
      redirect_to journals_path(:user_id => current_user), notice: '创建成功！'
    else
      render "new"
    end
  end

  def receiver_list
    emails = %w[zhangz-c@grandsoft.com.cn jiayp@grandsoft.com.cn  hanxm@grandsoft.com.cn  zhangsk@grandsoft.com.cn xumc@grandsoft.com.cn]
    hash = {}
    hash[params[:keyword]] = emails.select{|email| email.start_with? params[:keyword]  }
    render :json => hash.to_json
  end
end
