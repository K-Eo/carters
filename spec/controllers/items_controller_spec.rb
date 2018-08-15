require "rails_helper"

RSpec.describe ItemsController, type: :controller do
  subject { response }
  let(:slider) { create(:slider) }
  let(:user) { create(:user) }
  let(:call) { get :index }
  let(:item) { create(:item) }

  before do
    sign_in(user) if user.present?
    call
  end

  describe "GET index" do
    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to have_http_status(:ok) }
    end
  end

  describe "GET show" do
    let(:call) { get :show, params: { id: item.id } }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }
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
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "POST create" do
    let(:call) { post :create, params: { item: attributes_for(:item) } }

    context "when logged in" do
      it { is_expected.to redirect_to(item_path(Item.last)) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "GET edit" do
    let(:call) { get :edit, params: { id: item.id } }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "PUT update" do
    let(:call) { put :update, params: { id: item.id, item: attributes_for(:item) } }

    context "when logged in" do
      it { is_expected.to redirect_to(item_path(Item.last)) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "DELETE destroy" do
    let(:call) { delete :destroy, params: { id: item.id } }

    context "when logged in" do
      it { is_expected.to redirect_to(items_path) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end
end