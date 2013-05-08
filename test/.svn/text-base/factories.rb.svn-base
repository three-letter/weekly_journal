# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :user do
    sequence(:login) { |n| "foo#{n}" }
    sequence(:name) { |n| "foo#{n}" }
    email { "#{name}@example.com" }
    
    factory :admin do
      sequence(:login) { |n| "zhangz-c" }
    end
  end
  
  factory :positive_energy do
    association :author, :factory => :user
    content "some content"
  end
  
  factory :weekly_journal do
    association :author, :factory => :user
    title "some title"
    content "some content "*100
  end
  
  factory :weekly_journal_vote do
    association :user
    association :weekly_journal
    value 1
    week Week.this
  end
  
  factory :comment do
    association :author, :factory => :user
    content "some content"
    association :commentable
  end
  
  factory :user_action do
    sequence(:action_name) { |n| "foo#{n}" }
    sequence(:name) { |n| "foo#{n}" }
    as_available true
    
    factory :default_action do
      as_default true
    end
  end
  
  factory :role do
    name "foo"
  end
  
  factory :action_role do
    role
    user_action
  end  
end
