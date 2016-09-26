# frozen_string_literal: true
require_dependency "backend/application_controller"

module Backend
  class PartnersController < ::Backend::ApplicationController
    load_and_authorize_resource

    before_action :set_partner, except: [:index, :new, :create]

    def index
      @partners = Partner.all
    end

    def show
    end

    def edit
    end

    def new
      @partner = Partner.new
    end

    def update
      if @partner.update(partner_params)
        redirect_to partner_path(@partner), notice: 'Partner updated'
      else
        render :edit
      end
    end

    def create
      @partner = Partner.create(partner_params)
      if @partner.save
        redirect_to partners_path
      else
        render :new
      end
    end

    private

      def set_partner
        @partner = Partner.find(params[:id])
      end

      def partner_params
        params.require(:partner).permit!
      end
  end
end
