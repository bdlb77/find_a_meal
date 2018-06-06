class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit


  # Pundit: white-list approach.

  after_action :verify_authorized, except: [:home,:index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:home, :index], unless: :skip_pundit?
  
  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
