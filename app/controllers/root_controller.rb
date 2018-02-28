class RootController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index

  end

  def log_in

  end
end
