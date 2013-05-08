# -*- encoding : utf-8 -*-
class CodeReviewsController < ApplicationController
  def index
    @code_reviews = CodeReview.order("created_at DESC").paginate(:page => params[:page] || 1, :per_page => 10)
    render :layout => "application"
  end
  
  def show
    @code_review = CodeReview.find(params[:id])
  end

  def new
    @code_review = CodeReview.new
  end
  
  def edit
    @code_review = CodeReview.find(params[:id])
  end
  
  def create
    @code_review = CodeReview.new(params[:code_review])
    @code_review.author = current_user
    if @code_review.save
      redirect_to CodeReview, notice: '创建成功！'
    else
      render "new"
    end
  end
  
  def update
    @code_review = CodeReview.find(params[:id])
    if @code_review.update_attributes(params[:code_review])
      redirect_to CodeReview, notice: '更新成功！'
    else
      render "edit"
    end
  end

  def destroy
    @code_review = CodeReview.find(params[:id])
    @code_review.destroy
    redirect_to CodeReview, notice: '删除成功！'
  end
end
