# == Schema Information
#
# Table name: mahjong_sessions
#
#  id    :bigint           not null, primary key
#  title :string(255)      not null
#
class MahjongSession < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :mahjong_session_members, dependent: :destroy
  has_many :members, through: :mahjong_session_members

  before_validation :set_default_title
  validates :title, presence: true

  private

  def set_default_title
    self.title ||= Time.current.strftime('%Y年%m月%d日')
  end
end
