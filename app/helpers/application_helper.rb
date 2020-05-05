module ApplicationHelper
  def error_messages(obj)
    return if obj.errors.blank?

    content_tag(:div, class: 'error-mesages') do
      obj.errors.full_messages.each { |msg| concat(content_tag(:li, msg)) }
    end
  end

  def flash_messae_class(flash_type)
    return 'success' if flash_type == 'success'
    return 'infor' if flash_type == 'notice'
    return 'danger' if flash_type == 'error'
    return 'warning' if flash_type == 'alert'
  end
end
