# == Schema Information
#
# Table name: messages
#
#  id          :bigint           not null, primary key
#  chatroom_id :bigint           not null
#  user_id     :bigint           not null
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end