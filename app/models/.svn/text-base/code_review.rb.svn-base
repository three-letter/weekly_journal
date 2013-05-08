# == Schema Information
#
# Table name: code_reviews
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CodeReview < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  
  def author_name
    author.try(:name)
  end
end
