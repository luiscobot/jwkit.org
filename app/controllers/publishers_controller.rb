class PublishersController < ApplicationController
  def index
    @field_service_group_id = params[:field_service_group_id]
    @publishers = Publisher.where(field_service_group_id: @field_service_group_id)
  end
end
