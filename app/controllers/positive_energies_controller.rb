# -*- encoding : utf-8 -*-
class PositiveEnergiesController < ApplicationController
  def index
    @positive_energies = PositiveEnergy.paginate(:page => params[:page] || 1, :per_page => 20)
  end

  def new
    @positive_energy = PositiveEnergy.new
  end

  def edit
    @positive_energy = PositiveEnergy.find(params[:id])
    positive_energy_authorise
  end

  def create
    @positive_energy = PositiveEnergy.new(params[:positive_energy])
    @positive_energy.author = current_user
    if @positive_energy.save
      redirect_to positive_energies_path, notice: '创建成功！' 
    else
      render "new"
    end
  end

  def update
    @positive_energy = PositiveEnergy.find(params[:id])
    positive_energy_authorise
    if @positive_energy.update_attributes(params[:positive_energy])
      redirect_to positive_energies_path, notice: '修改成功！' 
    else
    end
  end

  def destroy
    @positive_energy = PositiveEnergy.find(params[:id])
    positive_energy_authorise
    @positive_energy.destroy
    redirect_to positive_energies_url, notice: '删除成功！' 
  end
  
  private
  def positive_energy_authorise
    unless current_user.can_edit?(@positive_energy)
      flash[:error] = '您没有权限！'
      redirect_to root_path
      return
    end
  end
end