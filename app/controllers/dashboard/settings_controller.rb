class Dashboard::SettingsController < DashboardController

  before_filter :instance_settings

  def edit
  end

  def update
  end

  private

  def instance_settings
    @settings = current_user.settings
  end
end
