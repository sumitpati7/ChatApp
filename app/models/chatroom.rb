# == Schema Information
#
# Table name: chatrooms
#
#  id         :bigint           not null, primary key
#  name       :string
#  is_group   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Chatroom < ApplicationRecord
end
