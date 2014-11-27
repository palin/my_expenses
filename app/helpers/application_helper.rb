module ApplicationHelper

  def translate(key)
    module_part = controller.class.name.split("::").first.downcase
    controller_part = controller_name

    I18n.t("#{module_part}.#{controller_part}.#{action_name}.#{key}")
  end

  def data_view_name
    controller_name.humanize
  end

  def dashboard_data_view_name
    "Dashboard#{data_view_name}"
  end

  def header_icon_name
    translate('icon')
  end
end
