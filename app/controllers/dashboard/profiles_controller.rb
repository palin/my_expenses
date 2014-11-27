class Dashboard::ProfilesController < DashboardController

  before_filter :instance_profile

  def show
  end

  def edit
  end

  def update
  end

  private

  def instance_profile
    @profile = current_user.settings
  end
end
