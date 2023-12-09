class PublishersController < ApplicationController
  def index
    @field_service_group = FieldServiceGroup.find(params[:field_service_group_id])
    @publishers = Publisher.where(field_service_group_id: @field_service_group.id)
  end
end
