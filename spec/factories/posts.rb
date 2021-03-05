FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    image { Faker::File.file_name }
  end

  factory :invalid_post, parent: :post do |p|
    p.title { nil }
    p.content { nil }
  end
end
