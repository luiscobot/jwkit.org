module FlashHelper
  def flash_style(type)
    if type.to_sym == :notice
      "bg-jw-success"
    elsif type.to_sym == :alert
      "bg-jw-warning"
    elsif type.to_sym == :error
      "bg-jw-error"
    end
  end
  
  def flash_icon(type)
    if type.to_sym == :notice
      "icons/success.svg"
    elsif type.to_sym == :alert
      "icons/failure.svg"
    elsif type.to_sym == :error
      "icons/failure.svg"
    end
  end
end
