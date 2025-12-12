require 'rails_helper'

RSpec.describe Resolvers::MemberResolver, type: :request do
  describe '#resolve' do
    subject { post graphql_path, params: { query: query } }
    let(:member) { create(:member) }
    let(:query) {
      <<~QUERY
        query {
          member(id: #{member.id}) {
            id
            name
          }
        }
      QUERY
    }

    it 'メンバーの情報が取得できること' do
      subject
      data = response.parsed_body['data']
      expect(data['member']['id']).to eq(member.id.to_s)
      expect(data['member']['name']).to eq(member.name)
    end
  end
end
