FactoryBot.define do
  factory :mahjong_session do
    title { 'テスト用タイトル' }

    trait :with_members do
      after(:create) do |mahjong_session|
        create_list(:mahjong_session_member, 4, mahjong_session: mahjong_session)
      end
    end
  end
end
