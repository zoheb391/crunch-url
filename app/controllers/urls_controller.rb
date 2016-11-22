class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.create(url_params)
    if @url.valid?
      redirect_to root_path
    else 
      render :new, :status => :unprocessable_entity
    end
  end

  private

  def url_params
    params.require(:url).permit(:target)
  end

end
