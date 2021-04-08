FactoryBot.define do
  factory :message do
    comment {Faker::Lorem.sentence}


    after(:build) do |message|
      message.avatar.attach(io: File.open('public/images/img.jpeg'), filename: 'img.jpeg')
    end
  end
end
