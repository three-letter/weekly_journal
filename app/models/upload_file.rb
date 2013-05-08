# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: upload_files
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  video      :string(255)
#

class UploadFile < ActiveRecord::Base
  attr_accessible :image, :video
  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
  scope :videos, where(:image => nil)

end