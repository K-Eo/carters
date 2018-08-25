require "rails_helper"

RSpec.feature "Homes", type: :feature do
  scenario "empty landing page" do
    visit root_path

    expect(page).to have_link("Inicio")
    expect(page).to have_link("Productos")
    expect(page).to have_link("Servicios")
    expect(page).to have_link("Contacto")

    expect(page).to have_content("Aún no hay productos y portadas")

    expect(page).not_to have_link("Nuevo producto")
    expect(page).not_to have_link("Nueva portada", class: "btn-primary")

    expect(page).to have_link("Iniciar sesión")
  end

  scenario "landing page with sliders" do
    slider1 = create(:slider_with_image).image.filename
    slider2 = create(:slider_with_image).image.filename

    visit root_path

    expect(page).to have_css("#landing-slider img[src*='#{slider1}']")
    expect(page).to have_css("#landing-slider img[src*='#{slider2}']")
  end

  scenario "landing page with items" do
    item = create(:item_with_cover)

    visit root_path

    expect(page).to have_content("Nombre de la categoría")
    expect(page).to have_css(".card img[src*='#{item.cover.filename}']")
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.price)
  end
end
