class StaticController < ApplicationController

  def indigenous
    render file: 'public/indigenous/index.html'
  end
end
