# -*- encoding : utf-8 -*-
# == Schema Information
#
# Table name: committees
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  party_id       :integer
#  party_group_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# -*- encoding : utf-8 -*-
require 'test_helper'

class CommitteeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
