class FieldServiceReportsController < ApplicationController
  def index
    @field_service_group = FieldServiceGroup.find(params[:field_service_group_id])
    last_month = Date.current.last_month.month
    last_month_year = Date.current.last_month.year
    @field_service_reports_from_last_month = @field_service_group.publishers.includes(:field_service_reports)
                                                                 .where(field_service_reports: { year: last_month_year, month: last_month })
                                                                 .map(&:field_service_reports).flatten
  end

  def new
    @publisher = Publisher.find(params[:publisher_id])
    @field_service_group = @publisher.field_service_group
    @field_service_report = FieldServiceReport.new
  end

  def create
    @publisher = Publisher.find(field_service_report_params[:publisher_id])
    @field_service_report = FieldServiceReport.new(field_service_report_params)
    if @field_service_report.save
      redirect_to field_service_group_publishers_url(@field_service_report.publisher.field_service_group_id), notice: "Field Service Report successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def field_service_report_params
    params.require(:field_service_report).permit(:month, :year, :shared_in_ministry, :bible_studies, :hours, :comments, :publisher_id)
  end
end
