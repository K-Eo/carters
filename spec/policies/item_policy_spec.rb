require "rails_helper"

RSpec.describe ItemPolicy do
  subject { described_class.new(user, item) }

  let(:item) { create(:item) }

  context "user" do
    let(:user) { create(:user) }

    it { should permit(:index) }
    it { should permit(:show) }
    it { should permit(:new) }
    it { should permit(:create) }
    it { should permit(:edit) }
    it { should permit(:update) }
    it { should permit(:destroy) }
  end
end
