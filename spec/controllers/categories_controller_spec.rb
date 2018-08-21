require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  subject { response }
  let(:category) { create(:category) }
  let(:user) { create(:user) }
  let(:call) { get :index }

  before do
    sign_in(user) if user.present?
    call
  end

  describe "GET #index" do
    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }

      it { is_expected.to render_template(:index) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "GET #new" do
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

  describe "GET #edit" do
    let(:call) { get :edit, params: { id: category.id } }

    context "when logged in" do
      it { is_expected.to have_http_status(:ok) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "POST #create" do
    let(:call) { post :create, params: { id: category.id, category: attributes_for(:category) } }

    context "when logged in" do
      it { is_expected.to redirect_to(categories_path) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "PUT #update" do
    let(:call) { put :update, params: { id: category.id, category: attributes_for(:category) } }

    context "when logged in" do
      it { is_expected.to redirect_to(edit_category_path(Category.last)) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end

  describe "DELETE #destroy" do
    let(:call) { delete :destroy, params: { id: category.id, category: attributes_for(:category) } }

    context "when logged in" do
      it { is_expected.to redirect_to(categories_path) }
    end

    context "when logged out" do
      let(:user) { nil }

      it { is_expected.to redirect_to(new_user_session_path) }
    end
  end
end
