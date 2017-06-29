FactoryGirl.define do
  
  factory :group do
    name           {Faker::Lorem.sentence}
  end
end
