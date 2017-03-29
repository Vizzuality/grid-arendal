# frozen_string_literal: true
class ErrorsController < ApplicationController
  def not_found
    redirect_path = nil
    split = params[:any].split("/")
    redirect_path =  redirect_from_old_site(split)
    user = User.where("LOWER(first_name) like LOWER(?)", "#{params[:any]}%").first unless redirect_path
    redirect_path = find_from_api if !redirect_path && !user

    if redirect_path.present? && !["404", "500"].include?(redirect_path)
      redirect_to redirect_path, :status => :moved_permanently,
        notice: "You have been redirected to GRID Arendal's new website. If this is not the content you are looking for, please use our new search by clicking the magnifying glass on the right hand side."
    elsif user.present?
      redirect_to staff_path(user)
    elsif split[0].downcase == "mastrec"
      redirect_to "http://news.grida.no/mastrec"
    elsif ["climate", "geo", "aeo", "geo1", "geo3", "geo2000"].include?(split[0])
      redirect_to "http://old.grida.no/#{request.fullpath}"
    else
      render "not_found.html", status: 404
    end
  end

  private

  def find_from_api
    require 'net/http'
    url = "http://service.grida.no/api/redirect?path=#{request.fullpath}"

    uri = URI(url)
    res = Net::HTTP.get_response(uri).try(:body)
    return nil unless res
    res.gsub('"','')
  end

  def redirect_from_old_site split
    case split[0].downcase
      when "default"
        root_url
      when "programmes"
        if split.size == 1
          about_index_url
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
          publications_url
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
          resources_url(media:"Graphic")
        end
      when "photolib"
        resources_url(media: "Photo")
      when "video"
        resources_url(media: "Video")
    end
  end
end
