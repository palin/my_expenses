class Dashboard::ProfilesController < DashboardController

  before_filter :instance_profile

  def show
  end

  def edit
  end

  def update
    current_user.update_attributes(profile_params)

    redirect_to dashboard_profile_path, notice: "Profile updated!"
  end

  private

  def instance_profile
    @profile = current_user
  end

  def profile_params
    params.require(:user).permit(:name, :email, :gender)
  end
end
