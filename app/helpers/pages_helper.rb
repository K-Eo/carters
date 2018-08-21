module PagesHelper
  def create_service(title, description, icon)
    content_tag :div, class: "col-4 p-4 mb-4" do
      content_tag :div, class: "shadow-sm text-center p-5" do
        concat octicon(icon, height: "60", class: "text-secondary")
        concat content_tag(:h6, title, class: "mt-3 font-weight-bold")
        concat content_tag(:p, description, class: "font-weight-light text-secondary")
      end
    end
  end

  def empty_state(description, &block)
    content_tag :div, class: "col-6 offset-3" do
      content_tag :div, class: "shadow-sm p-3 mb-5 bg-white rounded mt-5" do
        concat (content_tag :div, class: "text-center" do
          octicon("rocket", height: "120", class: "text-secondary")
        end)
        concat content_tag(:h4, description, class: "text-center  lead m-4")
        concat capture(&block)
      end
    end
  end
end
