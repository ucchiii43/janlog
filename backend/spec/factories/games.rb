FactoryBot.define do
  factory :game do
    mahjong_session { create(:mahjong_session) }
  end
end
