# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :related_items]
  before_action :set_item_limits, only: [:show, :related_items]

  def index
    @users = User.order(:first_name, :last_name)
  end

  def show
    @activities = @user.activities.limit(@activities_limit)
    @publications = @user.publications.order(content_date: :desc).limit(@publications_limit)
    @news = NewsArticle.limit(4).order(publication_date: :desc)
    @media_contents = MediaContent.albums_collections_and_videos.featured
  end

  def related_items
    @item_type = params[:item]

    if @item_type == 'activities'
      @items = @user.activities.offset(@activities_limit)
    elsif @item_type == 'publications'
      @items = @user.publications.order(content_date: :desc).offset(@publications_limit)
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
end
