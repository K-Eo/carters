require "rails_helper"

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, create(:category))
  end

  it "renders attributes in <p>" do
    render

    expect(rendered).to match(@category.name)
  end
end
