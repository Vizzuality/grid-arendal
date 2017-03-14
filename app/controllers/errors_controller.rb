# frozen_string_literal: true
class ErrorsController < ApplicationController
  def not_found
    redirect_path = nil
    case
      when ["programmes/", "programmes"].include?(params[:any])
        redirect_path = about_index_path
      when "programmes/blue-carbon" == params[:any]
        redirect_path = Activity.programmes.where(title: "Blue Carbon").first
      when "programmes/environmental-crime" == params[:any]
        redirect_path = Activity.programmes.
          where(title: "Environmental Crime").first
      when "programmes/green-economy" == params[:any]
        redirect_path = Activity.programmes.
          where(title: "Ecosystems Economies and Sustainable Development").first
      when "programmes/marine-coastal" == params[:any]
        redirect_path = Activity.programmes.
          where(title: "Ocean Governance and Geological Resources").first
      when "programmes/polar-mountain" == params[:any]
        redirect_path = Activity.programmes.
          where(title: "Polar and Mountain Environments").first
      when "programmes/soe-reporting" == params[:any]
        redirect_path = Activity.programmes.
          where(title: "State of the Environment and Spatial Planning").first
      when "programmes/transboundary-waters" == params[:any]
        redirect_path = Activity.programmes.
          where(title: "State of the Environment and Spatial Planning").first
      when "graphicslib" == params[:any]
        redirect_path = resources_path(media: "Graphic")
      when "photolib" == params[:any]
        redirect_path = resources_path(media: "Photo")
      when "video" == params[:any]
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
