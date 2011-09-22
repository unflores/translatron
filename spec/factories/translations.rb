FactoryGirl.define do

  factory :translation do |tran|
    sequence(:value) {|n| "derp" }
  end

end