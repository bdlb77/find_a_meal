class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.present?
      	scope.all
      else
      	scope.where(user: user)
      end
    end
  end

  def new?
  	true
  end

  def show?
    true
  end

  def edit?
  	record.user == user
  end

  def update?
  	record.user == user
  end
  
  def create?
    true  
  end
  
  def destroy?
    record.user == user  
  end
end
