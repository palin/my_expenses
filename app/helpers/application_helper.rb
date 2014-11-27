module ApplicationHelper

  def translate(key)
    module_part = controller.class.name.split("::").first.downcase
    controller_part = controller_name

    I18n.t("#{module_part}.#{controller_part}.#{action_name}.#{key}")
  end
end
