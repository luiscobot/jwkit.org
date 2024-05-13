class FieldServiceGroupsController < ApplicationController
  before_action :require_user!

  layout "dashboard"

  def index
    @field_service_groups = FieldServiceGroup.all
  end

  def new
    @field_service_group = FieldServiceGroup.new
    @action = I18n.t("field_service_group.create.title")
  end

  def create
    @field_service_group = FieldServiceGroup.new(field_service_group_params)

    if @field_service_group.save
      redirect_to field_service_groups_url, notice: I18n.t("field_service_group.create.notices.success")
    else
      @action = I18n.t("field_service_group.create.title")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def field_service_group_params
    params.require(:field_service_group).permit(:number)
  end
end
