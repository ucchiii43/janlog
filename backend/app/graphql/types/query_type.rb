module Types
  class QueryType < BaseObject
    field :member, resolver: Resolvers::MemberResolver
  end
end
