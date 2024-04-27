class FieldServiceReportsController < ApplicationController
  before_action :require_user!

  layout "dashboard"

  def index
    @field_service_group = FieldServiceGroup.find_by!(number: params[:field_service_group_id])
    @field_service_reports = @field_service_group.field_service_reports.from_last_month
  end

  def new
    @publisher = Publisher.find(params[:publisher_id])
    @field_service_group = @publisher.field_service_group
    @field_service_report = @publisher.field_service_reports.new
  end

  def create
    @publisher = Publisher.find(params[:publisher_id])
    @field_service_report = @publisher.field_service_reports.new(field_service_report_params)
    @field_service_report.year = Date.current.last_month.year
    @field_service_report.month = Date.current.last_month.month

    if @field_service_report.save
      redirect_to field_service_group_publishers_url(@publisher.field_service_group), notice: I18n.t("field_service_report.create.notices.success")
    else
      render :new, status: :unprocessable_entity
    end
  end

private

  def field_service_report_params
    params.require(:field_service_report).permit(:shared_in_ministry, :bible_studies, :hours, :comments)
  end
end
