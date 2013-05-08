# -*- encoding : utf-8 -*-
class CommentsController < ApplicationController
  
  def index
    @search = Comment.search(params[:q])
    @comments = @search.result.paginate(:page => params[:page] || 1, :per_page => 100)
  end
  
  def create
    @weekly_journal = WeeklyJournal.find(params[:weekly_journal_id])
    @commentable = params[:comment_id] ? Comment.find(params[:comment_id]) : @weekly_journal
    @comment = @commentable.comments.create(params[:comment].merge({ :weekly_journal_id => params[:weekly_journal_id], :user_id => current_user.id }))
    if @comment.save
      flash_info = "评论成功！"
    else
      flash_info = "请输入内容！"
    end
    @flash_content = flash_content(flash_info)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @flash_content = flash_content("删除成功！")
  end
end
