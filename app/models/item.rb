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

class Item < ApplicationRecord
  belongs_to :list



  def priority_opts
    %w(Low Medium High)
    # {"Low" => 0, "Medium" => 1, "High" => 2}
    # [[0, 'Zero'], [1, 'One'], [2, 'Two']]
  end
end
