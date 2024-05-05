module ApplicationHelper
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
