module FieldServiceReportsHelper
  def shared_in_ministry_style(field_service_report)
    field_service_report.shared_in_ministry? ? "text-jw-success" : "text-jw-warning"
  end
end
