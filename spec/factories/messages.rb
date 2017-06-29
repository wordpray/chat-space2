FactoryGirl.define do

  factory :message do
    body           {Faker::Lorem.sentence}
    image          {File.open("spec/image/test.png") }
    group
    user
  end
end
