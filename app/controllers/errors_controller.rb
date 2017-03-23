# frozen_string_literal: true
class ErrorsController < ApplicationController
  def not_found
    redirect_path = nil
    split = params[:any].split("/")
    redirect_path =  redirect_from_old_site(split)

    redirect_path = find_from_api unless redirect_path

    if redirect_path && redirect_path != "404"
      redirect_to redirect_path, :status => :moved_permanently,
        notice: "You have been redirected to GRID Arendal's new website. If this is not the content you are looking for, please use our new search by clicking the magnifying glass on the right hand side."
    else
      respond_to do |format|
        format.html { render status: 404 }
      end
    end
  rescue ActionController::UnknownFormat
    render status: 404
  end

  private

  def find_from_api
    require 'net/http'
    url = "http://service.grida.no/api/redirect?path=/#{params[:any]}"
    url = url + ".#{params[:format]}" if params[:format]

    uri = URI(url)
    JSON.parse(Net::HTTP.get(uri))
  end

  def redirect_from_old_site split
    case split[0].downcase
      when "default"
        root_path
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
      when "publications"
        if split.size < 3
          publications_path
        elsif split[1] == "et"
          case split[2]
            when "ep2"
              Publication.where(title: "The Environment and Poverty Times #2").first
            when "ep4"
              Publication.where(title: "Environment and Poverty Times #4").first
          end
        elsif split[2] == "ipcc_tar"
          Publication.where(title: "IPCC - Climate Change 2001: Synthesis Report").first
        elsif split[2] == "food-crisis"
          Publication.where(title: "The Environmental Food Crisis").first
        elsif split[2] == "natural-fix"
          Publication.where(title: "The Natural Fix? The Role of Ecosystems in Climate Mitigation").first
        elsif split[2] == "orangutan"
          Publication.where(title: "The Last Stand of the Orangutang").first
        elsif split[2] == "our-precious-coasts"
          Publication.where(title: "Our Precious Coasts").first
        elsif split[2] == "africa"
          Publication.where(title: "Vital Climate Graphics Africa").first
        elsif split[2] == "climate"
          Publication.where(title: "Vital Climate Graphics").first
        elsif split[2] == "climate"
          Publication.where(title: "Vital Climate Graphics").first
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
      when "bluesolutions"
        Activity.where(title: "Blue Solutions").first
      when "uarctic"
        Activity.where(title: "University of the Arctic").first
      when "crimfish"
        Activity.find(275) # exists in production
      when "graphicslib"
        if split.size < 3
          resources_path(media: "Graphic")
        else
          g = case split[2]
              when "difference-between-eia-and-sea_5148"
                Graphic.where(title: "Difference between EIA and SEA").first
              when "major-river-basins-of-africa_1ac3"
                Graphic.where(title: "Major river basins of Africa").first
              when "mediterranean-sea-water-masses-vertical-distribution_d84b"
                Graphic.where(title: "Mediterranean Sea water masses: vertical distribution").first
              when "total-global-saltwater-and-freshwater-estimates_39f6"
                Graphic.where(title: "Total global saltwater and freshwater estimates").first
              when "trends-in-population-developed-and-developing-countries-1750-2050-estimates-and-projections_1616"
                Graphic.where(title: "Trends in population, developed and developing countries, 1750-2050 (estimates and projections)").first
              end
          resource_path(g)
        end
      when "photolib"
        resources_path(media: "Photo")
      when "video"
        resources_path(media: "Video")
    end
  end
end
