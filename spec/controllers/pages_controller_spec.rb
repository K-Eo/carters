require "rails_helper"

RSpec.describe PagesController, type: :controller do
  subject { response }
  let(:pages) { create(:slider) }
  let(:user) { create(:user) }
  let(:call) { get :contact }

  before do
    sign_in(user) if user.present?
    call
  end

  describe "GET contact" do
    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:contact) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:contact) }
    end
  end
end
