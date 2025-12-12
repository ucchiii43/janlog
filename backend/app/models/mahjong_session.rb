# == Schema Information
#
# Table name: mahjong_sessions
#
#  id    :bigint           not null, primary key
#  title :string(255)      not null
#
class MahjongSession < ApplicationRecord

  has_many :games, dependent: :destroy

  before_validation :set_default_title
  validates :title, presence: true

  private

  def set_default_title
    self.title ||= Time.current.strftime('%Y年%m月%d日')
  end
end
