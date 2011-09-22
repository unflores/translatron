FactoryGirl.define do
  sequence :tkey do |n|
    "some_key#{n}"
  end

  sequence :scope do |n|
    "some.scope#{n}"
  end

  factory :translation_key do |tk|
    scope
    tkey
    after_create { |tk| tk.translations << Factory(:translation) }
  end

end