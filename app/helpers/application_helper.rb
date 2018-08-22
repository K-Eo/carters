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

  private
    def safe_params
      params.except(:host, :post, :protocol).permit!
    end
end
