require "auto/version"
require File.expand_path('../helpers/auto_helper.rb', __FILE__)
class AutoUtils
  def self.copy_files
    require "fileutils"
    dir = "app/assets/stylesheets"
    file = File.expand_path('../stylesheets/auto.css', __FILE__)
    fileUtils.mkdir_p dir unless File.exists? dir 
    FileUtils.cp(file, dir)

    dir = "app/assets/javascripts"
    file = File.expand_path('../javascripts/auto.js', __FILE__)
    fileUtils.mkdir_p dir unless File.exists? dir 
    FileUtils.cp(file, dir)
  end
end

AutoUtils.copy_files
