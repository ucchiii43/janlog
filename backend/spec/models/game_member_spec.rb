require 'rails_helper'

RSpec.describe GameMember, type: :model do
  describe 'associations' do
    context 'gameが存在しない場合' do
      let(:game_member) { build(:game_member, game: nil) }
      it '無効であること' do
        expect(game_member).to be_invalid
      end
    end

    context 'memberが存在しない場合' do
      let(:game_member) { build(:game_member, member: nil) }
      it '無効であること' do
        expect(game_member).to be_invalid
      end
    end
  end

  describe 'validations' do
    describe 'score' do
      context 'nilの場合' do
        let(:game_member) { build(:game_member, score: nil) }
        it '無効であること' do
          expect(game_member).to be_invalid
        end
      end

      context '負の値の場合' do
        let(:game_member) { build(:game_member, score: -1) }
        it '有効であること' do
          expect(game_member).to be_valid
        end
      end

      context '0の場合' do
        let(:game_member) { build(:game_member, score: 0) }
        it '有効であること' do
          expect(game_member).to be_valid
        end
      end
    end

    describe 'rank' do
      context 'nilの場合' do
        let(:game_member) { build(:game_member, rank: nil) }
        it '無効であること' do
          expect(game_member).to be_invalid
        end
      end

      context '0の場合' do
        let(:game_member) { build(:game_member, rank: 0) }
        it '無効であること' do
          expect(game_member).to be_invalid
        end
      end

      context '負の値の場合' do
        let(:game_member) { build(:game_member, rank: -1) }
        it '無効であること' do
          expect(game_member).to be_invalid
        end
      end
    end

    describe 'point' do
      context 'nilの場合' do
        let(:game_member) { build(:game_member, point: nil) }
        it '無効であること' do
          expect(game_member).to be_invalid
        end
      end

      context '0の場合' do
        let(:game_member) { build(:game_member, point: 0.0) }
        it '有効であること' do
          expect(game_member).to be_valid
        end
      end

      context '負の値の場合' do
        let(:game_member) { build(:game_member, point: -1.0) }
        it '有効であること' do
          expect(game_member).to be_valid
        end
      end

      context '小数点第2位まである場合' do
        let(:game_member) { build(:game_member, point: 100.01) }
        it '四捨五入されて100.0になること' do
          expect(game_member.point).to eq(100.0)
        end
      end
    end
  end
end
