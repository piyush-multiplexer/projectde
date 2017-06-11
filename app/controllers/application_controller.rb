class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_ability
    user_signed_in? ? @current_ability ||= Ability.new(current_user) : @current_ability ||= Ability.new(current_admin)
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json {head :forbidden, content_type: 'text/html'}
      format.html {redirect_to root_url, notice: exception.message}
      format.js {head :forbidden, content_type: 'text/html'}
    end
  end
end
