class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.admin? or not record.update?
  end

  def destroy?
    record.users == user
  end
end
