FactoryGirl.define do
  factory :message do
    body           {Faker::Lorem.sentence}
    # image          {Faker::Avatar.image}
    # image          File.open(File.join(Rails.root, '/spec/image/test.png'))
    image          { File.open("spec/image/test.png") }
    group_id       {Faker::Number.number(1)}
    user_id        {Faker::Number.number(1)}
  end
end
