module Resolvers
  class MemberResolver < BaseResolver
    argument :id, ID, required: true

    type Types::MemberType, null: true

    def resolve(id:)
      Member.find_by(id:)
    end
  end
end
