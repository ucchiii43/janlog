# == Schema Information
#
# Table name: members
#
#  id   :bigint           not null, primary key
#  name :string(255)      not null
#
class Member < ApplicationRecord
  has_many :game_members, dependent: :destroy
  has_many :games, through: :game_members
  has_many :mahjong_session_members, dependent: :destroy
  has_many :mahjong_sessions, through: :mahjong_session_members

  validates :name, presence: true
end
