FactoryBot.define do
  factory :game_member do
    association :game
    association :member
    score { 50000 }
    rank { 1 }
    point { 70.0 }
  end
end
