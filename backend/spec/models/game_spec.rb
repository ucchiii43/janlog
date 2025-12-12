require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'associations' do
    context 'mahjong_sessionが存在しない場合' do
      let(:game) { build(:game, mahjong_session: nil) }
      it '無効であること' do
        expect(game).to be_invalid
      end
    end
  end
end
