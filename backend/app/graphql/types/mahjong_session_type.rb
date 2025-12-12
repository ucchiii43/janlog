module Types
  class MahjongSessionType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :members, [Types::MemberType], null: false
  end
end
