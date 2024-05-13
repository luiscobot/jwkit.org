class PublishersController < ApplicationController
  before_action :require_user!

  layout "dashboard"

  def index
    @field_service_group = FieldServiceGroup.find_by!(number: params[:field_service_group_id])
    @publishers = @field_service_group.publishers
  end

  def new
    @publisher = Publisher.new
    @field_service_groups = FieldServiceGroup.all
    @action = I18n.t("publisher.create.title")
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to publisher_url(@publisher), notice: I18n.t("publisher.create.notices.success")
    else
      @field_service_groups = FieldServiceGroup.all
      @action = I18n.t("publisher.create.title")
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
    @field_service_groups = FieldServiceGroup.all
    @action = I18n.t("publisher.update.title")
  end

  def update
    @publisher = Publisher.find(params[:id])

    if @publisher.update(publisher_params)
      redirect_to publisher_url(@publisher), notice: I18n.t("publisher.update.notices.success")
    else
      @field_service_groups = FieldServiceGroup.all
      @action = I18n.t("publisher.update.title")
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @publisher = Publisher.find(params[:id])
    publisher_reports = @publisher.field_service_reports.from_current_service_year
    months = (1..12).to_a
    @field_service_reports = []

    months.each do |month|
      report = publisher_reports.find { |report| report.month == month }

      if report
        @field_service_reports << report
      else
        @field_service_reports << nil
      end
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:first_name, :last_name, :date_of_birth, :gender, :date_of_baptism, :group, :service_privilege, :field_service_group_id)
  end
end
