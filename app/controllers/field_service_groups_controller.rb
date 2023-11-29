class FieldServiceGroupsController < ApplicationController
  def index
    @field_service_groups = FieldServiceGroup.all
  end
end
