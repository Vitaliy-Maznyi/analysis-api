FactoryGirl.define do
  factory :user do
    sequence(:email) {|i| "email#{i}@email.com"}
    password 'password'
    password_confirmation 'password'
    provider 'email'
    uid :email
    tokens { TokenHelper::generate_token }
  end
end