FactoryBot.define do
  factory :fix do
    title   { Faker::Lorem.characters(number: 26) }
    comment  { Faker::Lorem.characters(number: 50) }
    genre_id { 2 }

    after(:build) do |fix|
      fix.image.attach(io: File.open('public/images/img.jpeg'), filename: 'img.jpeg')
    end
  end
end
