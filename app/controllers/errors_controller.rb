# frozen_string_literal: true
class ErrorsController < ApplicationController
  def not_found
    redirect_path = nil
    split = params[:any].split("/")
    case split[0]
      when "programmes"
        redirect_path = if split.size == 1
                          about_index_path
                        elsif "blue-carbon" == split[1]
                          Activity.programmes.where(title: "Blue Carbon").first
                        elsif "environmental-crime" == split[1]
                          Activity.programmes.
                            where(title: "Environmental Crime").first
                        elsif "green-economy" == split[1]
                          Activity.programmes.
                            where(title: "Ecosystems Economies and Sustainable Development").first
                        elsif "marine-coastal" == split[1]
                          Activity.programmes.
                            where(title: "Ocean Governance and Geological Resources").first
                        elsif "polar-mountain" == split[1]
                          Activity.programmes.
                            where(title: "Polar and Mountain Environments").first
                        elsif "soe-reporting" == split[1]
                          Activity.programmes.
                            where(title: "State of the Environment and Spatial Planning").first
                        end
      when "graphicslib"
        redirect_path = resources_path(media: "Graphic")
      when "photolib"
        redirect_path = resources_path(media: "Photo")
      when "video"
        redirect_path = resources_path(media: "Video")
    end

    if redirect_path
      redirect_to redirect_path, :status => :moved_permanently
    else
      respond_to do |format|
        format.html { render status: 404 }
      end
    end
  rescue ActionController::UnknownFormat
    render status: 404
  end
end
