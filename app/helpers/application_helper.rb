module ApplicationHelper

  def flash_class(key)
    case key
     when 'notice' then 'is_succes'
     when 'alert' then 'is_danger'
    end
  end
end
