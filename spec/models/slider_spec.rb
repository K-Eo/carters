require "rails_helper"

RSpec.describe Slider, type: :model do
  describe "scopes" do
    let(:active) { create(:slider, active: true) }
    let(:inactive) { create(:slider, active: false) }

    before do
      active
      inactive
    end

    it "returns only active sliders" do
      expect(Slider.actives).to eq([active])
    end

    it "orders by active" do
      expect(Slider.order_by_active).to eq([active, inactive])
    end

    it "orders by newest" do
      expect(Slider.order_by_newest).to eq([inactive, active])
    end
  end
end
