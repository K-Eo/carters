module ApplicationHelper
  def filter_link(sort, name = nil)
    name = name || sort.titleize
    link_to name, safe_params.merge(sort: sort), class: "dropdown-item"
  end

  def active_nav_when(kontroller, action = nil)
    klass = ["nav-link", "text-secondary"]

    if kontroller == controller_name
      if action.nil? || (action.present? && action == action_name)
        klass.push("font-weight-bold")
      end
    end

    klass.join(" ")
  end

  def nav_title
    if content_for?(:nav_title)
      content_for(:nav_title)
    else
      content_tag :span, class: "navbar-brand text-secondary" do
        title, icon = nav_title_lookup
        concat octicon(icon, height: 24, width: 24, class: "d-inline-block align-top mr-3")
        concat content_tag :span, title
      end
    end
  end

  private
    def safe_params
      params.except(:host, :post, :protocol).permit!
    end

    def nav_title_lookup
      default_lookup = "nav.#{controller_name}.#{action_name}"
      fallback_lookup = "nav.#{controller_name}"

      title = translate(:title, scope: default_lookup,
        default: translate(:title, scope: fallback_lookup)
      )

      icon = translate(:icon, scope: default_lookup,
        default: translate(:icon, scope: fallback_lookup)
      )

      [title, icon]
    end
end
