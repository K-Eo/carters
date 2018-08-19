include ActionDispatch::TestProcess

FactoryBot.define do
  factory :item do
    title "Title"
    price 9.99
    description "Description"

    factory :item_with_image do
      after(:create) do |item|
        item.images.attach fixture_file_upload("spec/fixtures/item.png")
      end
    end
  end
end
