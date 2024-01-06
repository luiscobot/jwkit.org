module ApplicationHelper
  def label_style
    "font-medium text-sm leading-6 text-jw-bunting"
  end

  def control_style
    "py-1.5 border-0 shadow-sm rounded-md text-sm leading-6 text-jw-bunting ring-1 ring-inset ring-jw-san-marino/25 focus:ring-2 focus:ring-inset focus:ring-jw-san-marino disabled:bg-jw-black/5 disabled:cursor-not-allowed"
  end

  def reports_date(month)
    if month
      I18n.localize(Date.new(Date.current.year, month.to_i, 1), format: "%B, %Y")
    else
      I18n.localize(Date.current.last_month, format: "%B, %Y")
    end
  end

  def last_month_date
    I18n.localize(Date.current.last_month, format: "%B, %Y")
  end
end
