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
      @items = Publication.by_lead_user(@user.id) + @user.publications.published.order_by_content_date
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
      @activities = Activity.by_lead_user(@user.id).limit(@activities_limit)
      if @activities.size < @activities_limit
        @activities = @activities + @user.activities.published.order_by_content_date.limit(@activities_limit - @activities.size)
      end
    end

    def set_publications
      @publications = Publication.by_lead_user(@user.id).limit(@publications_limit)
      if @publications.size < @publications_limit
        @publications = @publications + @user.publications.published.order_by_content_date.limit(@publications_limit - @publications.size)
      end
    end
end
