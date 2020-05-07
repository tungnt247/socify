FactoryBot.define do
  factory :comment do |c|
    c.content { Faker::Lorem.paragraph }
  end

  factory :invalid_comment, parent: :comment do |c|
    c.content { nil }
  end
end
