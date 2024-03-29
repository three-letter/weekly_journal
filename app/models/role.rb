# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :action_roles
  has_many :action_names, :through => :action_roles
end