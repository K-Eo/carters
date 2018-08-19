include ActionDispatch::TestProcess

FactoryBot.define do
  factory :slider do
    active true

    factory :slider_with_image do
      after(:create) do |slider|
        slider.image.attach fixture_file_upload("spec/fixtures/slider.jpeg")
      end
    end
  end
end
