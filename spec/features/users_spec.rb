require "rails_helper"

RSpec.feature "Users", type: :feature do
  before do
    @user = create(:user)
  end

  scenario "sign in" do
    visit root_path

    click_link "Iniciar sesión"

    fill_in "Correo electrónico", with: @user.email
    fill_in "Contraseña", with: "12345678"

    click_button "Iniciar sesión"

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Portadas")
    expect(page).to have_link("Nueva portada")
    expect(page).to have_link("Nuevo producto")

    expect(page).to have_link("Cerrar sesión")
  end

  scenario "sign out" do
    login_as(@user)

    click_link "Cerrar sesión"

    expect(current_path).to eq(root_path)
    expect(page).not_to have_link("Portadas")
    expect(page).not_to have_link("Nueva portada")
    expect(page).not_to have_link("Nuevo producto")

    expect(page).not_to have_link("Cerrar sesión")
  end

  scenario "reset password" do
    visit root_path

    click_link "Iniciar sesión"
    click_link "¿Ha olvidado su contraseña?"

    fill_in "Correo electrónico", with: @user.email

    click_button "instrucciones para restablecer"

    expect(page).to have_content("recibirás un correo con instrucciones")
    expect(last_email.to).to include(@user.email)
  end
end
