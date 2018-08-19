module FeatureHelpers
  def login_as(user)
    visit root_path

    click_link "Iniciar sesión"

    fill_in "Correo electrónico", with: user.email
    fill_in "Contraseña", with: "12345678"

    click_button "Iniciar sesión"
  end
end
