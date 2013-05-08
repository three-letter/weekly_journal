# -*- encoding : utf-8 -*-
class UploadFilesController < ApplicationController
  def index
    @upload_files = UploadFile.last(4)
  end

  def create
    @upload_file = UploadFile.create(params[:upload_file])
    @flash_content = flash_content("上传成功！")
  end

  def destroy
    @upload_file = UploadFile.find(params[:id])
    @upload_file.destroy
    @flash_content = flash_content("删除成功！")
  end
end