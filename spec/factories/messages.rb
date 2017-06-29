FactoryGirl.define do

  factory :message do
    body           {Faker::Lorem.sentence}
    image          {File.open("spec/image/test.png") }
    association :group, factory: :group
    association :user, factory: :user
  end
end
