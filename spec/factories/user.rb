FactoryGirl.define do
  factory User do
    name "name"
    email "email@example.com"
    password "password"
    password_confirmation "password"
    location "location"
    profile "profile"

    factory :user_alice do
      name "alice"
      email "alice@example.com"
    end

    factory :user_bob do
      name "bob"
      email "bob@example.com"
    end
  end
end
