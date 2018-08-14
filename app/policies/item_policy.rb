class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def destroy?
    user.present?
  end

  def edit?
    user.present?
  end
end
