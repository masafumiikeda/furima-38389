FactoryBot.define do
  factory :item do
    name          {Faker::Name.initials(number: 2)}
    description   {'あああああああああ'}
    category_id   {2}
    status_id     {2}
    delivery_id   {2}
    prefecture_id {2}
    duration_id   {2}
    price         {5000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
