# frozen_string_literal: true
class GraphicRequestsController < ApplicationController

  def show
    graphic_request = GraphicRequest.where(download_hash: params[:id]).first
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
