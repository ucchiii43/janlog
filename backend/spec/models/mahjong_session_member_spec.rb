require 'rails_helper'

RSpec.describe MahjongSessionMember, type: :model do
  describe 'associations' do
    context 'mahjong_sessionが存在しない場合' do
      let(:mahjong_session_member) { build(:mahjong_session_member, mahjong_session: nil) }
      it '無効であること' do
        expect(mahjong_session_member).to be_invalid
      end
    end

    context 'memberが存在しない場合' do
      let(:mahjong_session_member) { build(:mahjong_session_member, member: nil) }
      it '無効であること' do
        expect(mahjong_session_member).to be_invalid
      end
    end
  end
end
