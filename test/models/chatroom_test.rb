# == Schema Information
#
# Table name: chatrooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  is_group   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ChatroomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
