FactoryBot.define do
  factory :blog do
    title 'test title'
    body 'test body'
    association :user
  end
end
