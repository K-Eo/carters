include ActionDispatch::TestProcess

FactoryBot.define do
  factory :item do
    title "Title"
    price 9.99
    description "Description"
    category

    factory :item_with_cover do
      after(:create) do |item|
        item.cover.attach fixture_file_upload("spec/fixtures/item.png")
      end
    end
  end
end
