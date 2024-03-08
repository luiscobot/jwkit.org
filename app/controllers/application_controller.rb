class ApplicationController < ActionController::Base
  include Passwordless::ControllerHelpers

  helper_method :current_user

  private

  def current_user
    @current_user ||= authenticate_by_session(User)
  end

  def require_user!
    return if current_user
    save_passwordless_redirect_location!(User)
    redirect_to users_sign_in_url, alert: t("passwordless.sessions.create.sign_in_error")
  end
end
