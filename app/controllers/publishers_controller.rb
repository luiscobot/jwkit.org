class PublishersController < ApplicationController
  before_action :require_user!

  layout 'dashboard'

  def index
    @field_service_group = FieldServiceGroup.find(params[:field_service_group_id])
    @publishers = @field_service_group.publishers.missing_last_month_reports
  end
end
