class GraphicRequestsController < ApplicationController

  def new
    @graphic_request = GraphicRequest.
      new(media_attachment_id: params[:media_attachment_id])
  end

  def create
    @graphic_request = GraphicRequest.create(graphic_request_params)
    if @graphic_request.save
      # send email
    end
  end

  private

  def graphic_request_params
    params.require(:graphic_request).permit(:email, :name, :media_attachment_id)
  end
end
