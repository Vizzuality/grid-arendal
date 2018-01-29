class StaticController < ApplicationController

  layout false

  def indigenous
    render file: 'public/indigenous/index.html'
  end

  def ipcc
    render file: 'public/climate/ipcc/index.htm'
  end

  def ipcc_tar
    render file: 'public/climate/ipcc_tar/index.htm'
  end

  def vital
    render file: 'public/climate/vital/index.htm'
  end

  def vitalafrica
    render file: 'public/climate/vitalafrica/index.htm'
  end

  def aeo
    render file: 'public/aeo/index.htm'
  end
end
