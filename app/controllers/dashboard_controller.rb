class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    @my_urls = my_urls
  end

  def my_urls
    if user_signed_in?
      @my_urls = Url.where('user_id = ?', current_user.id)
    end
  end
end
