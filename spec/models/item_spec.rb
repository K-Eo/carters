require "rails_helper"

RSpec.describe Item, type: :model do
  let(:discount) { 10 }
  let(:price) { 100 }
  let(:with_discount) { false }
  let(:item) { create(:item, discount: discount, price: price, with_discount: with_discount) }

  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_numericality_of(:price).is_greater_than(0) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }

  describe "#discount" do
    context "with discount" do
      before { allow(subject).to receive(:with_discount?).and_return(true) }

      it { is_expected.to validate_presence_of(:discount) }
      it { is_expected.to validate_numericality_of(:discount).only_integer
                                                             .is_greater_than(0)
                                                             .is_less_than(100) }
    end

    context "without discount" do
      before { allow(subject).to receive(:with_discount?).and_return(false) }

      it { is_expected.not_to validate_presence_of(:discount) }
      it { is_expected.not_to validate_numericality_of(:discount) }
    end
  end

  describe "#with_discount?" do
    subject { item.with_discount? }

    it { is_expected.to be_falsy }

    context "when true" do
      let(:with_discount) { true }

      it { is_expected.to be_truthy }
    end
  end

  describe "total" do
    subject { item.total }
    let(:price) { 100 }

    it { is_expected.to eq(100) }

    context "when with_discount is true" do
      let(:with_discount) { true }

      it { is_expected.to eq(90) }
    end
  end
end
