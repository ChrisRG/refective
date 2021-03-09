class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user_is_customer_owner_or_admin?
  end

  def create?
    true
  end

  def update?
    user_is_customer_or_admin?
  end

  def destroy?
    user_is_customer_or_admin?
  end

  private

  def user_is_customer_owner_or_admin?
    user == record.user ||
      user == record.space.user ||
      user.admin
  end

  def user_is_customer_or_admin?
    user == record.user || user.admin
  end
end
