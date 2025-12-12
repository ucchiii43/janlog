require 'rails_helper'

RSpec.describe MahjongSession, type: :model do
  describe 'validations' do
    subject { mahjong_session.save }

    describe 'title' do
      context '設定されていない場合' do
        let(:mahjong_session) { build(:mahjong_session, title: nil) }
        it 'デフォルトのタイトルが設定されること' do
          subject
          expect(mahjong_session.title).to eq(Time.current.strftime('%Y年%m月%d日'))
        end
      end

      context '設定されている場合' do
        let(:mahjong_session) { build(:mahjong_session, title: '忘年会') }
        it '設定されたタイトルが保存されること' do
          subject
          expect(mahjong_session.title).to eq('忘年会')
        end
      end
    end
  end
end
