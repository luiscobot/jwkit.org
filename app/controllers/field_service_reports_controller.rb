class FieldServiceReportsController < ApplicationController
  def index
    @field_service_group = FieldServiceGroup.find(params[:field_service_group_id])
    @field_service_reports = @field_service_group.publishers.includes(:field_service_reports).map(&:field_service_reports).flatten
  end

  def new
    @publisher = Publisher.find(params[:publisher_id])
    @field_service_report = FieldServiceReport.new
  end

  def create
    @field_service_report = FieldServiceReport.new(field_service_report_params)
    @field_service_report.save
    redirect_to field_service_group_publishers_url(@field_service_report.publisher.field_service_group_id)
  end

  private

  def field_service_report_params
    params.require(:field_service_report).permit(:month, :year, :shared_in_ministry, :bible_studies, :hours, :comments, :publisher_id)
  end
end
