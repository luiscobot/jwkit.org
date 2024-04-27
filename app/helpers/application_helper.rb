module ApplicationHelper
  def label_style
    "font-inter font-medium text-base text-jw-onyx"
  end

  def checkbox_style
    "h-6 w-6 rounded-lg border-none ring-2 ring-inset ring-jw-san-marino/50 text-jw-san-marino hover:ring-jw-san-marino focus:ring-inset focus:ring-jw-san-marino focus:ring-offset-0"
  end

  def control_style
    "px-3 py-2 border-none rounded-lg font-inter text-base text-jw-onyx ring-2 ring-inset ring-jw-san-marino/50 hover:ring-jw-san-marino focus:ring-inset focus:ring-2 focus:ring-jw-san-marino disabled:bg-jw-san-marino/50 disabled:cursor-not-allowed disabled:ring-transparent"
  end

  def reports_date(month, year)
    I18n.localize(Date.new(year.to_i, month.to_i, 1), format: "%B, %Y")
  end

  def last_month_date
    I18n.localize(Date.current.last_month, format: "%B, %Y")
  end

  def current_year
    Date.current.year
  end
end
