module FieldServiceReportsHelper
  def current_month
    Date.current.month
  end

  def month_options
    options_for_select((1..12).map { |month| [Date::MONTHNAMES[month], month] }, current_month)
  end

  def current_year
    Date.current.year
  end

  def year_options
    options_for_select((current_year - 1..current_year + 1).to_a, current_year)
  end
end
