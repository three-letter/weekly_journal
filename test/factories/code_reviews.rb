# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :code_review do
    user_id 1
    title "MyString"
    content "MyText"
  end
end
