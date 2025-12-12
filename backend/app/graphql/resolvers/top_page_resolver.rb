module Resolvers
  class TopPageResolver < BaseResolver
    type Types::TopPageType, null: false

    def resolve
      {}
    end
  end
end
