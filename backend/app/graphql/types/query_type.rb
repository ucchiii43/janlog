module Types
  class QueryType < BaseObject
    field :member, resolver: Resolvers::MemberResolver
    field :top_page, resolver: Resolvers::TopPageResolver
    field :mahjong_session, resolver: Resolvers::MahjongSessionResolver
  end
end
