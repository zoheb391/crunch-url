class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
    redirect_to @url.target
  end

  def new
    @url = Url.new
  end

  def create
    @url = current_user.urls.create(url_params)
    if @url.valid?
      @url.save
      redirect_to dashboard_path(current_user)
    else 
      render :new, :status => :unprocessable_entity
    end
  end

  private

  def url_params
    params.require(:url).permit(:target)
  end

end
