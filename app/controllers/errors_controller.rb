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
      when "publications"
        if split.size < 3
          publications_path
        else
          case params[:any]
            when "publications/et/ep2/page/2501.aspx"
              Publication.where(title: "The Environment and Poverty Times #2").first
            when "publications/et/ep4/page/2632.aspx"
              Publication.where(title: "Environment and Poverty Times #4").first
            when "publications/et/ep4/page/2638.aspx"
              Publication.where(title: "Environment and Poverty Times #4").first
            when "publications/other/ipcc_tar/default.aspx", "/publications/other/ipcc_tar/default.aspx?src=/climate/ipcc_tar/", "/publications/other/ipcc_tar/default.aspx?src=/climate/ipcc_tar/wg1/index.htm"
              Publication.where(title: "IPCC - Climate Change 2001: Synthesis Report").first
          end
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
