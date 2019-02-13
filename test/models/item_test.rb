# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  content    :text
#  list_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  priority   :string
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
