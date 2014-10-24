class ExpensesController < ApplicationController

  before_filter :require_logged_user, only: [:index]

  def index
  end

  private

  def require_logged_user
    redirect_to root_path, alert: "You have to be logged in to see this page!" and return unless current_user.present?
  end
end
