module FieldServiceReportsHelper
  def last_month
    Date.current.last_month.month
  end

  def month_options
    options_for_select((1..12).map { |month| [Date::MONTHNAMES[month], month] }, last_month)
  end

  def last_month_year
    Date.current.last_month.year
  end

  def year_options
    options_for_select((last_month_year - 1..last_month_year + 1).to_a, last_month_year)
  end
end
