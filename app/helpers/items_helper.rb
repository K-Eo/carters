module ItemsHelper
  def discount_classes(item)
    klass = []
    klass.push("d-none") unless item.with_discount?
    klass.join(" ")
  end
end
