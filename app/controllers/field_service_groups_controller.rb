class FieldServiceGroupsController < ApplicationController
  def index
    @groups = FieldServiceGroup.all
  end
end
