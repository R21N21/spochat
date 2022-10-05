FactoryBot.define do
  factory :user do
    name                  {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
  end
end
