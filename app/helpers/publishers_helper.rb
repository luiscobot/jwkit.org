module PublishersHelper
  def field_service_report_month(field_service_report, index)
    if field_service_report.present?
      I18n.t("date.month_names")[field_service_report.month]
    else
      I18n.t("date.month_names")[index + 1]
    end
  end

  def field_service_report_shared_in_ministry(field_service_report)
    if field_service_report.present?
      inline_svg_tag "icons/#{ field_service_report.shared_in_ministry? ? 'success' : 'failure' }.svg", class: "w-6 #{ field_service_report.shared_in_ministry? ? "text-jw-success" : "text-jw-warning" }"
    end
  end

  def field_service_report_bible_studies(field_service_report)
    if field_service_report.present?
      if field_service_report.bible_studies.present?
        field_service_report.bible_studies
      else
        tag.span "", class: "m-auto w-4 h-1 rounded bg-jw-quick-silver"
      end
    end
  end

  def field_service_report_hours(field_service_report)
    if field_service_report.present?
      if field_service_report.hours.present?
        field_service_report.hours
      else
        tag.span "", class: "m-auto w-4 h-1 rounded bg-jw-quick-silver"
      end
    end
  end

  def field_service_report_comments(field_service_report)
    if field_service_report.present?
      if field_service_report.comments.present?
        field_service_report.comments
      else
        tag.span "", class: "m-auto w-4 h-1 rounded bg-jw-quick-silver"
      end
    end
  end

  def field_service_report_bible_auxiliary_pioneer(field_service_report)
    if field_service_report.present?
      inline_svg_tag "icons/#{ field_service_report.auxiliary_pioneer? ? 'success' : 'failure' }.svg", class: "w-6 #{ field_service_report.auxiliary_pioneer? ? "text-jw-success" : "text-jw-warning" }"
    end
  end
end
