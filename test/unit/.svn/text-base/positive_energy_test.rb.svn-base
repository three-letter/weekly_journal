# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: positive_energies
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PositiveEnergyTest < ActiveSupport::TestCase
  test "author_name" do
    positive_energe = create(:positive_energy)
    author = positive_energe.author
    assert_equal author.name, positive_energe.author_name
  end
end
