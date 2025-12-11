require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'validations' do
    subject { member.valid? }

    describe 'name' do
      context 'nilの場合' do
        let(:member) { build(:member, name: nil) }
        it { is_expected.to be_falsey }
      end

      context '空文字の場合' do
        let(:member) { build(:member, name: '') }
        it { is_expected.to be_falsey }
      end

      context '文字列の場合' do
        let(:member) { build(:member, name: 'John Doe') }
        it { is_expected.to be_truthy }
      end
    end
  end
end
