class SpacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user_is_admin_or_owner?
  end

  def destroy?
    user_is_admin_or_owner?
  end

  private

  def user_is_admin_or_owner?
    user == record.user || user.admin
  end
end
