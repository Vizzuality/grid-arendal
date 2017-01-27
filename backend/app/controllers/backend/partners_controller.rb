# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class PartnersController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_partner, except: [:index, :new, :create, :paginate]
    before_action :set_partners

    def index
    end

    def edit
    end

    def new
      @partner = Partner.new
    end

    def update
      if @partner.update(partner_params)
        redirect_to edit_partner_url(@partner),
          notice: 'Partner updated'
      else
        render :edit
      end
    end

    def create
      @partner = Partner.create(partner_params)
      if @partner.save
        redirect_to edit_partner_url(@partner),
          notice: 'Partner created'
      else
        render :new
      end
    end

    def destroy
      @partner = Partner.find(params[:id])
      if @partner.destroy
        redirect_to partners_url
      end
    end

    def paginate
      @items = Partner.order(:name)
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

      def set_partner
        @partner = Partner.find(params[:id])
      end

      def set_partners
        @partners = Partner.order(:name).limit(@index_items_limit * @page)
      end

      def partner_params
        params.require(:partner).permit!
      end
  end
end
