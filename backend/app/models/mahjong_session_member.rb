# == Schema Information
#
# Table name: mahjong_session_members
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  mahjong_session_id :bigint           not null
#  member_id          :bigint           not null
#
# Indexes
#
#  idx_on_mahjong_session_id_member_id_f84a6ffdc0  (mahjong_session_id,member_id) UNIQUE
#
class MahjongSessionMember < ApplicationRecord
  belongs_to :mahjong_session
  belongs_to :member
end
