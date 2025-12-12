module Types
  class TopPageType < BaseObject
    field :members, [Types::MemberType], null: false
    field :mahjong_sessions, [Types::MahjongSessionType], null: false

    def members
      Member.all
    end

    def mahjong_sessions
      MahjongSession.order(created_at: :desc).limit(5)
    end
  end
end
