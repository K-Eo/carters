require 'rails_helper'

RSpec.feature "Items", type: :feature do
  scenario "exploring without items" do
    visit root_path

    click_link "Productos"

    expect(current_path).to eq(items_path)
    expect(page).to have_content("no hay productos")
    expect(page).to have_css(".card", count: 0)
    expect(page).not_to have_link("2")
  end

  scenario "exploring items" do
    item = create(:item_with_image)

    visit root_path

    click_link "Productos"

    expect(page).to have_css(".card .img-wrapper img[src*='#{item.images.first.filename}']")
    expect(page).to have_css(".card .card-title", text: item.title)
    expect(page).to have_css(".card .card-text", text: item.description)
    expect(page).to have_css(".card .card-text", text: item.price)
  end

  scenario "exploring items with paginator" do
    create_list(:item, 48)

    visit root_path

    click_link "Productos"

    expect(page).to have_css(".card", count: 24)
    expect(page).to have_link("2")
    expect(page).to have_link("Siguiente")
    expect(page).to have_link("Último")

    click_link "2"

    expect(page).to have_link("1")
    expect(page).to have_link("Atrás")
    expect(page).to have_link("Primero")
  end

  scenario "searching items" do
    create(:item, title: "foo")
    create(:item, title: "bar")

    visit root_path

    click_link "Productos"

    expect(page).to have_css(".card", count: 2)

    fill_in "Buscar", with: "foo"
    find("input[type=submit]").click

    expect(page).to have_css(".card", count: 1)
    expect(page).to have_content("foo")
    expect(page).not_to have_content("bar")
    expect(page).to have_field("query", with: "foo")

    fill_in "Buscar", with: "bar"
    find("input[type=submit]").click

    expect(page).to have_css(".card", count: 1)
    expect(page).to have_content("bar")
    expect(page).not_to have_content("foo")
    expect(page).to have_field("query", with: "bar")
  end

  scenario "searching items without results" do
    create(:item, title: "foo")
    create(:item, title: "bar")

    visit root_path

    click_link "Productos"

    expect(page).to have_css(".card", count: 2)

    fill_in "Buscar", with: "baz"
    find("input[type=submit]").click

    expect(page).to have_css(".card", count: 0)
    expect(page).not_to have_content("foo")
    expect(page).not_to have_content("bar")
    expect(page).to have_field("query", with: "baz")

    expect(page).to have_content("No hay resultados para baz")
  end

  scenario "searching items with paginator" do
    create_list(:item, 48, title: "foo")
    create_list(:item, 24, title: "bar")

    visit root_path

    click_link "Productos"

    expect(page).to have_css(".card", count: 24)

    fill_in "Buscar", with: "foo"
    find("input[type=submit]").click

    expect(page).to have_css(".card", count: 24)
    expect(page).to have_link("2")
    expect(page).to have_link("Último")
  end

  scenario "creating first item" do
    login_as create(:user)

    visit root_path

    find("a.text-white").click

    click_link "Nuevo producto"

    fill_in "Nombre", with: "Foo"
    fill_in "Descripción", with: "Bar"
    fill_in "Precio", with: 9.99
    attach_file Rails.root.join("spec/fixtures/item.png")

    click_button "Crear Producto"

    visit items_path

    expect(page).to have_content("Foo")
    expect(page).to have_content("Bar")
    expect(page).to have_content("9.99")
    expect(page).to have_css("img[src*='item.png']")
  end

  scenario "creating item" do
    create(:item)

    login_as create(:user)

    visit root_path

    click_link "Nuevo producto"

    fill_in "Nombre", with: "Foo"
    fill_in "Descripción", with: "Bar"
    fill_in "Precio", with: 9.99
    attach_file Rails.root.join("spec/fixtures/item.png")

    click_button "Crear Producto"

    visit items_path

    expect(page).to have_content("Foo")
    expect(page).to have_content("Bar")
    expect(page).to have_content("9.99")
    expect(page).to have_css("img[src*='item.png']")
  end

  scenario "updating item" do
    item = create(:item)

    login_as create(:user)

    visit items_path

    click_link "Editar"

    fill_in "Nombre", with: "Foo1"
    fill_in "Descripción", with: "Bar1"
    fill_in "Precio", with: 19.99
    attach_file Rails.root.join("spec/fixtures/item.png")

    click_button "Actualizar Producto"

    visit items_path

    expect(page).to have_content("Foo1")
    expect(page).to have_content("Bar1")
    expect(page).to have_content("19.99")
    expect(page).to have_css("img[src*='item.png']")
  end

  scenario "deleting item" do
    item = create(:item)

    login_as create(:user)

    visit items_path

    click_link "Eliminar"

    expect(current_path).to eq(items_path)
    expect(page).to have_css(".card", count: 0)
  end
end
