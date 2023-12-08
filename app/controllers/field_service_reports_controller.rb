class FieldServiceReportsController < ApplicationController
  def new
    @publisher = Publisher.find(params[:publisher_id])
    @field_service_report = FieldServiceReport.new(publisher_id: @publisher)
  end
end
