class DashboardController < ApplicationController
  layout 'dashboard'

  before_filter :require_logged_user

  protected

  def require_logged_user
    redirect_to root_path, alert: "You have to be logged in to see this page!" and return unless current_user.present?
  end
end