# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :related_activities]
  before_action :set_activities_limit, only: [:show, :related_activities]

  def index
    @users = User.order(:first_name, :last_name)
  end

  def show
    @activities = @user.activities.limit(@activities_limit)
    @publications = @user.publications.order(content_date: :desc).limit(3)
    @news = NewsArticle.limit(4).order(publication_date: :desc)
    @media_contents = MediaContent.albums_collections_and_videos.featured
  end

  def related_activities
    @activities = @user.activities.offset(@activities_limit)
    respond_to do |format|
      if(@activities.empty?)
        head :no_content
      end
      format.js
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_activities_limit
      @activities_limit = 3
    end
end
