# frozen_string_literal: true
class GraphicRequestsController < ApplicationController

  def show
    graphic_request = GraphicRequest.find_by!(download_hash: params[:id])
    attach = graphic_request.media_attachment
    if attach && attach.document.exists?
      data = if ENV['AWS_ACCESS_KEY_ID'].present?
               open(attach.document.url)
             else
               File.open(attach.document.path)
             end
      send_data data.read, filename: attach.document_file_name,
        type: attach.document_content_type
    else
      raise ActiveRecord::RecordNotFound
    end
  end

  def new
    @graphic_request = GraphicRequest.
      new(media_attachment_id: params[:media_attachment_id],
          graphic_id: params[:graphic_id])
  end

  def create
    if !params[:super_name].present?
      graphic_request = GraphicRequest.create(graphic_request_params)
      @graphic = graphic_request.graphic
      if graphic_request.save
        GraphicRequestMailer.graphic_requested(graphic_request).deliver_now
        redirect_to resource_url(@graphic),
          notice: "Graphic has been requested, you should receive an email with the necessary information soon."
      end
    end
  end

  private

  def graphic_request_params
    params.require(:graphic_request).permit(:email, :name, :graphic_id,
                                            :media_attachment_id)
  end
end
