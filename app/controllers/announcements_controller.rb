# -*- encoding : utf-8 -*-

class AnnouncementsController < ApplicationController
  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def create
    @announcement = Announcement.new(params[:announcement])
    if @announcement.save
      redirect_to Announcement, notice: '创建成功！'
    else
      render action: "new"
    end
  end

  def update
    @announcement = Announcement.find(params[:id])

    if @announcement.update_attributes(params[:announcement])
      redirect_to Announcement, notice: '修改成功！'
    else
      render action: "edit"
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to announcements_url 
  end
  
  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids
    render :nothing => true
  end
end