module Resolvers
  class MahjongSessionResolver < BaseResolver
    argument :id, ID, required: true

    type Types::MahjongSessionType, null: true

    def resolve(id:)
      MahjongSession.find_by(id:)
    end
  end
end
