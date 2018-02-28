module Users
  class OmniauthCallbacksController < ApplicationController
    def starladder
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted?
        sign_in_and_redirect @user
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
