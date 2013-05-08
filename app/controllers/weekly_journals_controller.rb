# -*- encoding : utf-8 -*-
class WeeklyJournalsController < ApplicationController
  def index
    @week = params[:week] || smart_week
    @week_instance = Week.new(@week)
    @weekly_journals = WeeklyJournal.on_week(@week).includes(:comments)
  end

  def show
    @weekly_journal = WeeklyJournal.find(params[:id])
    @week = @weekly_journal.week
    @weekly_journal.visited!
  end

  def new
    @week = params[:week] || Week.this
    @weekly_journal = WeeklyJournal.new
  end

  def create
    @weekly_journal = WeeklyJournal.new(params[:weekly_journal])
    @weekly_journal.author = current_user
    if params[:week]
      @weekly_journal.week = params[:week]
    end
    if @weekly_journal.save
      redirect_to @weekly_journal, notice: '创建成功！'
    else
      render "new"
    end
  end

  def edit
    @weekly_journal = WeeklyJournal.find(params[:id])
    @week = @weekly_journal.week
    journal_authorise
  end

  def update
    @weekly_journal = WeeklyJournal.find(params[:id])
    journal_authorise
    if @weekly_journal.update_attributes(params[:weekly_journal])
      redirect_to @weekly_journal, notice: '更新成功！'
    else
      render "edit"
    end
  end

  def destroy
    @weekly_journal = WeeklyJournal.find(params[:id])
    @weekly_journal.destroy
    redirect_to weekly_journals_path, notice: '删除成功！'
  end

  def vote
    @weekly_journal = WeeklyJournal.find(params[:id])
    flash[:notice] = current_user.vote!(@weekly_journal)
    redirect_to :back
  end

  private
  def smart_week
    this_week = case Date.today.wday
    when 1 .. 3
      Week.this - 1
    else
      Week.this
    end
  end

  def journal_authorise
    unless current_user.can_edit?(@weekly_journal)
      flash[:error] = '您没有权限！'
      redirect_to root_path
      return
    end
  end
end
