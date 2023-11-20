class FieldServiceGroupController < ApplicationController
  def index
    @groups = FieldServiceGroup.all
  end
end
