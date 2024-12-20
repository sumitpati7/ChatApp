# == Schema Information
#
# Table name: chat_users
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  chatroom_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ChatUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
