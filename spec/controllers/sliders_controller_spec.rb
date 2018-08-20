require "rails_helper"

RSpec.describe SlidersController, type: :controller do
  subject { response }
  let(:slider) { create(:slider) }
  let(:user) { create(:user) }
  let(:call) { get :index }

  before do
    sign_in(user) if user.present?
    call
  end

  describe "GET index" do
    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:index) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "GET show" do
    let(:params) { { id: slider.id } }
    let(:call) { get :show, params: params }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:show) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "GET new" do
    let(:call) { get :new }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:new) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "POST create" do
    let(:params) { { slider: attributes_for(:slider) } }
    let(:call) { post :create, params: params }

    context "when logged in" do
      it { is_expected.to redirect_to(Slider.last) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "GET edit" do
    let(:call) { get :edit, params: { id: slider.id } }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "PUT update" do
    let(:params) { { id: slider.id, slider: attributes_for(:slider) } }
    let(:call) { put :update, params: params }

    context "when logged in" do
      it { is_expected.to redirect_to(Slider.last) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "DELETE destroy" do
    let(:call) { delete :destroy, params: { id: slider.id } }

    context "when logged in" do
      it { is_expected.to redirect_to(sliders_path) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "PUT toggle_state" do
    let(:call) { put :toggle_state, params: { id: slider.id }, xhr: true }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:toggle_state) }

      it "changes slider active state" do
        slider.reload
        expect(slider.active).to be_falsy
      end
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to have_http_status(:unauthorized) }
    end
  end
end
