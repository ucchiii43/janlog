# == Schema Information
#
# Table name: game_members
#
#  id              :bigint           not null, primary key
#  point(ポイント) :decimal(5, 1)    not null
#  rank(順位)      :integer          not null
#  score(得点)     :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  game_id         :bigint           not null
#  member_id       :bigint           not null
#
# Indexes
#
#  index_game_members_on_game_id_and_member_id  (game_id,member_id) UNIQUE
#
class GameMember < ApplicationRecord
  belongs_to :game
  belongs_to :member

  validates :score, presence: true
  validates :rank, presence: true, numericality: { greater_than: 0 }
  validates :point, presence: true
end
