FactoryBot.define do
  factory :user do |u|
    u.name { Faker::Name.name }
    u.email { Faker::Internet.unique.email }
    u.password { '123456' }
  end
end
