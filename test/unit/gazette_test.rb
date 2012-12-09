# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: gazettes
#
#  id         :integer          not null, primary key
#  content    :text(2147483647)
#  ly_id      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -*- encoding : utf-8 -*-
require 'test_helper'

class GazetteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
