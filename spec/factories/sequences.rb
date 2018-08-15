FactoryBot.define do
  sequence :email do |n|
    "user_#{n}@carters.com"
  end
end
