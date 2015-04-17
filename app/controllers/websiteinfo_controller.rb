class WebsiteinfoController < ApplicationController
  def contact
    @websiteinfo = Websiteinfo.find(1)
  end
  
  def about
    @websiteinfo = Websiteinfo.find(2)
  end
  
  def create
  end
end
