# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.order(:first_name, :last_name)
  end

  def show
    @activities = @user.activities.limit(3)
    @publications = @user.publications.limit(3)
    @news = NewsArticle.limit(4).order(publication_date: :desc)
    @media_contents = MediaContent.albums_collections_and_videos.featured
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
