class StaticController < ApplicationController

  layout false

  def indigenous
    render file: 'public/indigenous/index.html'
  end

  def ipcc
    render file: 'public/climate/ipcc/index.htm'
  end
end
