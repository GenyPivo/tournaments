class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to teams_path, flash: { error: 'Page only for authorized users' }
    end
  end
end
