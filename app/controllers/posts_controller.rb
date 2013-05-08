class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @weekly_journals = @user.weekly_journals.order("created_at DESC").paginate(:page => params[:page] || 1, :per_page => 5)
    render :layout => "application"
  end
end