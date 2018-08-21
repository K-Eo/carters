require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  let(:category1) { create(:category) }
  let(:category2) { create(:category) }

  before(:each) do
    assign(:categories, [category1, category2])
  end

  it "renders a list of categories" do
    render

    assert_select "tr>td", :text => category1.name
    assert_select "tr>td", :text => category2.name
  end
end
