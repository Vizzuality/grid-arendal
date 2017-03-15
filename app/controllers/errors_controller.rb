# frozen_string_literal: true
class ErrorsController < ApplicationController
  def not_found
    redirect_path = nil
    split = params[:any].split("/")
    redirect_path = case split[0].downcase
      when "programmes"
        if split.size == 1
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
      when "environmental_crime"
        Activity.programmes.where(title: "Environmental Crime").first
      when "bluecarbon"
        Activity.programmes.where(title: "Blue Carbon").first
      when "africa"
        Activity.where(title: "Africa").first
      when "comms"
        Activity.where(title: "Communication and Outreach").first
      when "eesd"
        Activity.where(title: "Ecosystems Economies and Sustainable Development").first
      when "oceangov"
        Activity.programmes.where(title: "Ocean Governance and Geological Resources").first
      when "polar"
        Activity.programmes.where(title: "Polar and Mountain Environments").first
      when "soe"
        Activity.programmes.
          where(title: "State of the Environment and Spatial Planning").first
      when "blueforests"
        Activity.where(title: "Blue Forests Project").first
      when "mastrec"
        "http://news.grida.no/mastrec"
      when "bluesolutions"
        Activity.where(title: "Blue Solutions").first
      when "uarctic"
        Activity.where(title: "University of the Arctic").first
      when "crimfish"
        Activity.find(275) # exists in production
      when "graphicslib"
        resources_path(media: "Graphic")
      when "photolib"
        resources_path(media: "Photo")
      when "video"
        resources_path(media: "Video")
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
