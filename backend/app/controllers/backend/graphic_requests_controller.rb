# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class GraphicRequestsController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_graphic_request,  except: [:index, :fetch, :paginate]
    before_action :set_graphic_requests, except: [:destroy, :paginate]

    def index
    end

    def edit
    end

    def destroy
      @graphic_request = GraphicRequest.find(params[:id])
      if @graphic_request.destroy
        redirect_to graphic_requests_url
      end
    end

    def paginate
      @items = GraphicRequest.order(created_at: :desc)
                      .limit(@index_items_limit)
                      .offset(@index_items_limit * (@page - 1))
      @item_id = params[:id].present? ? params[:id].to_i : nil
      respond_to do |format|
        if(@items.empty?)
          head :no_content
        end
        format.js { render 'backend/shared/index_items_paginate' }
      end
    end

    private

      def set_graphic_request
        @graphic_request = GraphicRequest.find(params[:id])
      end

      def set_graphic_requests
        @graphic_requests = GraphicRequest.graphic_requests(filter_params, @index_items_limit * @page)
      end
  end
end
