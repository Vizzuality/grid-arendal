# frozen_string_literal: true
require_dependency 'backend/application_controller'

module Backend
  class PartnersController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_partner,  except: [:index, :new, :create]
    before_action :set_partners, except: :index

    def index
    end

    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end

    def new
      @partner = Partner.new
      respond_to do |format|
        format.html
        format.js
      end
      render :edit
    end

    def update
      if @partner.update(partner_params)
        redirect_to partners_url, notice: 'Partner updated'
      else
        render :edit
      end
    end

    def create
      @partner = Partner.create(partner_params)
      if @partner.save
        redirect_to partners_url
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

    private

      def set_partner
        @partner = Partner.find(params[:id])
      end

      def set_partners
        @partners = Partner.order(:name)
      end

      def partner_params
        params.require(:partner).permit!
      end
  end
end
