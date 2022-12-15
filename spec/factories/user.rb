FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    gender { %w(female male).sample }

    after(:build) do |user|
      user.picture.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'sample.jpg')), filename: 'sample.jpg', content_type: 'image/jpg')
    end
  end
end
