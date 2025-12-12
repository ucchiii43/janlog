require 'rails_helper'

RSpec.describe Resolvers::MahjongSessionResolver, type: :request do
  describe '#resolve' do
    subject { post graphql_path, params: { query: query } }
    let(:mahjong_session) { create(:mahjong_session, :with_members) }
    let(:query) {
      <<~QUERY
        query {
          mahjongSession(id: #{mahjong_session.id}) {
            id
            title
            members {
              id
              name
            }
          }
        }
      QUERY
    }

    it 'セッションの情報が取得できること' do
      subject
      data = response.parsed_body['data']
      aggregate_failures do
        expect(data['mahjongSession']['id']).to eq(mahjong_session.id.to_s)
        expect(data['mahjongSession']['title']).to eq(mahjong_session.title)
        expect(data['mahjongSession']['members'].count).to eq(mahjong_session.members.count)
        expect(data['mahjongSession']['members'].map { |member| member['id'] }).to match_array(mahjong_session.members.pluck(:id).map(&:to_s))
        expect(data['mahjongSession']['members'].map { |member| member['name'] }).to match_array(mahjong_session.members.pluck(:name))
      end
    end
  end
end
