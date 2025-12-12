# == Schema Information
#
# Table name: games
#
#  id                 :bigint           not null, primary key
#  mahjong_session_id :bigint           not null
#
class Game < ApplicationRecord
  belongs_to :mahjong_session
end
