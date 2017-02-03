# frozen_string_literal: true
module Backend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_nav_links
    before_action :set_page_param
    before_action :set_search_param
    before_action :set_index_items_limit

    layout 'backend/layouts/backend'

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end

    private

    def set_nav_links
      @links = [
        {name: "Activities", path: activities_path,
         key: "activities", count: Activity.count},
        {name: "Publications", path: publications_path,
          key: "publications", count: Publication.count},
        {name: "News", path: news_articles_path,
          key: "news_articles", count: NewsArticle.count},
        {name: "Albums & Pics", path: albums_path,
         key: "albums", count: MediaContent.albums_and_photos.count},
       {name: "Collec. & Graphs", path: collections_path,
         key: "collections", count: MediaContent.collections_and_graphics.count},
        {name: "Video Collec. & Videos", path: video_collections_path,
         key: "video_collections", count: MediaContent.video_collections_and_videos.count},
        {name: "Events", path: events_path,
          key: "events", count: Event.count},
        {name: "Partners", path: partners_path,
          key: "partners", count: Partner.count},
        {name: "Staff", path: users_path,
          key: "users", count: User.count},
        {name: "About Sections", path: about_sections_path,
          key: "about_sections", count: AboutSection.count},
        {name: "Content types", path: content_types_path,
          key: "content_types", count: ContentType.count},
        {name: "Tags", path: tags_path,
          key: "tags", count: Tag.count},
        {name: "Vacancies", path: vacancies_path,
          key: "vacancies", count: Vacancy.count},
        {name: "Sections", path: site_sections_path,
          key: "sections", count: SiteSection.count}
      ]
    end

    def set_page_param
      @page = params[:page].present? ? params[:page].to_i : 1
    end

    def set_search_param
      @search = params[:search].present? ? params[:search] : nil
    end

    def set_index_items_limit
      @index_items_limit = 30
    end

    def filter_params
      params.permit(:search, :featured, :visibility_off)
    end
  end
end
