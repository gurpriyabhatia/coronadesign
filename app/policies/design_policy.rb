class DesignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # def new?
  #   false # noone can create a new design
  # end

  def create?
    return true # anyone can create a design
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    # only admin can delete a design

    # only owner can delete a design
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
