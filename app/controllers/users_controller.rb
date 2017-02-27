# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :related_items]
  before_action :set_item_limits, only: [:show, :related_items]
  before_action :set_activities, only: [:show]
  before_action :set_publications, only: [:show]

  def index
    @users = User.order(:first_name, :last_name)
  end

  def show
    @news = NewsArticle.limit(4).order(publication_date: :desc)
    @media_contents = MediaContent.albums_collections_and_videos.featured
  end

  def related_items
    @item_type = params[:item]

    if @item_type == 'activities'
      @items = Activity.by_lead_user(@user.id) + @user.activities.published.order_by_content_date
    elsif @item_type == 'publications'
      @items = @user.related_publications
    end

    respond_to do |format|
      if(@items.empty?)
        head :no_content
      end
      format.js
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_item_limits
      @activities_limit = 3
      @publications_limit = 3
    end

    def set_activities
      @activities = @user.related_activities(@activities_limit)
    end

    def set_publications
      @publications = @user.related_publications(@publications_limit)
    end
end
