class SessionsController < ApplicationController
  def create
    @user = User.koala(auth_hash['credentials'])
    session = UserSession.new(@user)
    session.save

    redirect_to new_expense_path
  end

  def destroy
    current_user_session.destroy if current_user_session

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
