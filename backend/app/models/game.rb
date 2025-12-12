# == Schema Information
#
# Table name: games
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  mahjong_session_id :bigint           not null
#
class Game < ApplicationRecord
  belongs_to :mahjong_session
  has_many :game_members, dependent: :destroy
  has_many :members, through: :game_members
end
