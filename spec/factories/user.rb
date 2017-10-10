# Create fake user and admin accounts
FactoryGirl.define do
  factory :user do |f|
    f.email "test@lclark.edu"
    password "password"
    password_confirmation "password"
    f.admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do |f|
    f.email "admin@lclark.edu"
    password "password"
    password_confirmation "password"
    f.admin true
  end
end
