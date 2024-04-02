class PagesController < ApplicationController
  def main
    if current_user
      redirect_to field_service_groups_url
    else
      redirect_to users_sign_in_url
    end
  end
end
