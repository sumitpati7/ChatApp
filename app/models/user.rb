# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_name              :string
#  first_name             :string
#  last_name              :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_many :chat_users
  has_many :chatrooms, through: :chat_users

  after_create_commit { broadcast_append_to "users" }

  scope :all_except, ->(user) { where.not(id: user) }


  def profile_completed?
    required_fields = [:first_name, :last_name, :user_name]
    required_fields.all? { |field| self[field].present? }
  end
end
