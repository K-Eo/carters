require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "active_nav_when" do
    subject { helper.active_nav_when(kontroller, action) }
    let(:kontroller) { "welcome" }
    let(:action) { nil }

    before do
      allow(helper).to receive(:controller_name) { "welcome" }
      allow(helper).to receive(:action_name) { "index" }
    end

    context "when matches controller" do
      it { is_expected.to eq("nav-link text-secondary font-weight-bold") }
    end

    context "when controller is different" do
      let(:kontroller) { "items" }

      it { is_expected.to eq("nav-link text-secondary") }
    end

    context "when matches controller and action" do
      let(:action) { "index" }

      it { is_expected.to eq("nav-link text-secondary font-weight-bold") }
    end

    context "when matches controller but action" do
      let(:action) { "show" }

      it { is_expected.to eq("nav-link text-secondary") }
    end
  end
end
