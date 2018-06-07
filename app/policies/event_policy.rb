class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all #get all
    end
  end

  def home?
    true
  end

  def index?
  	true
  end



  def edit?
    record.user == user
  end

  def create?
    true
  end

end
