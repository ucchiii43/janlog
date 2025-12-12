require 'rails_helper'

RSpec.describe Resolvers::TopPageResolver, type: :request do
  describe '#resolve' do
    subject { post graphql_path, params: { query: query } }

    let!(:mahjong_session_1) { create(:mahjong_session, :with_members, title: '麻雀セッション1', created_at: 1.month.ago) }
    let!(:mahjong_session_2) { create(:mahjong_session, :with_members, title: '麻雀セッション2', created_at: 1.year.ago) }
    let(:query) {
      <<~QUERY
        query {
          topPage {
            members {
              id
              name
            }
            mahjongSessions {
              id
              title
            }
          }
        }
      QUERY
    }

    it 'メンバーと麻雀セッションの情報が取得できること' do
      subject
      data = response.parsed_body['data']
      aggregate_failures do
        expect(data['topPage']['members'].count).to eq(mahjong_session_1.members.count + mahjong_session_2.members.count)
        expect(data['topPage']['mahjongSessions'].count).to eq(2)
        expect(data['topPage']['mahjongSessions'][0]['title']).to eq(mahjong_session_1.title)
        expect(data['topPage']['mahjongSessions'][1]['title']).to eq(mahjong_session_2.title)
      end
    end
  end
end
