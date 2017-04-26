# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :set_selected_section, only: [:index]
  before_action :set_limit, only: [:index]

  helper_method :options_filter

  def index
    @query = params[:query] && params[:query].strip
    if @query.present?

      case @selected_section
        when 'News'
          set_news
        when 'Activities'
          set_activities
        when 'Publications'
          set_publications
        when 'Graphics'
          set_graphics
        when 'Photos'
          set_photos
        when 'Videos'
          set_videos
        when 'Staff'
          set_staff
        else
          set_news
          set_activities
          set_publications
          set_media_contents
          set_staff
      end
    end
  end

  private
    def options_filter
      params.permit(:query, :section)
    end

    def set_selected_section
      @selected_section = params[:section]
    end

    def set_limit
      @search_limit = @selected_section ? 100 : 20
    end

    def set_news
      @news = NewsArticle.
        search_for(@query).
        limit(@search_limit)
    end

    def set_activities
      @activities = Activity.
        published.
        search_for(@query).
        limit(@search_limit)
    end

    def set_publications
      @publications = Publication.
        published.
        search_for(@query).
        limit(@search_limit)
    end

    def set_media_contents
      @media_contents = MediaContent.
        search_for(@query).
        limit(@search_limit)
    end

    def set_graphics
      @media_contents = MediaContent.
        graphics.
        search_for(@query).
        limit(@search_limit)
    end

    def set_photos
      @media_contents = MediaContent.
        photos.
        search_for(@query).
        limit(@search_limit)
    end

    def set_videos
      @media_contents = MediaContent.
        videos.
        search_for(@query).
        limit(@search_limit)
    end

    def set_staff
      @staff = User.
        search_for(@query).
        limit(@search_limit)
    end
end
