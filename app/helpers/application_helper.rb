module ApplicationHelper
  def filter_link(sort, name = nil)
    name = name || sort.titleize
    link_to name, safe_params.merge(sort: sort), class: "dropdown-item"
  end

  private
    def safe_params
      params.except(:host, :post, :protocol).permit!
    end
end
