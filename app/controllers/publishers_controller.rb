class PublishersController < ApplicationController
  before_action :require_user!

  layout "dashboard"

  def index
    @field_service_group = FieldServiceGroup.find_by!(number: params[:field_service_group_id])
    @publishers = @field_service_group.publishers
  end
end
