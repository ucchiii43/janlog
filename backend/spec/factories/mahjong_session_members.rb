FactoryBot.define do
  factory :mahjong_session_member do
    association :mahjong_session
    association :member
  end
end
