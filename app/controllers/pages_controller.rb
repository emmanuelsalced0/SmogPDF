class PagesController < ApplicationController
  def homepage
    @notindex=true
  end
  def about
    @notindex=true
  end
  
end
