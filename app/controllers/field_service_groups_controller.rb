class FieldServiceGroupsController < ApplicationController
  before_action :require_user!

  layout 'dashboard'

  def index
    @field_service_groups = FieldServiceGroup.all
  end
end
