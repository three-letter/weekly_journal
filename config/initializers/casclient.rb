# -*- encoding : utf-8 -*-
require 'casclient'
require 'casclient/frameworks/rails/filter' 
CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "http://cas.grandsoft.com.cn/"
)